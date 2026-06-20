import { spawn } from "child_process";
import { createWriteStream } from "node:fs";
import * as fs from "fs/promises";
import * as path from "path";
import { fileURLToPath } from "url";
import util from "node:util";
import { PKG_ARCHES, PKG_ARCHIVE_SUFFIX } from "./build-config.ts";

const scriptDir = path.dirname(fileURLToPath(import.meta.url));

export const repoRoot = path.resolve(scriptDir, "..");

export function repoPath(...parts: string[]) {
  return path.join(repoRoot, ...parts);
}

export const buildLogsDir = path.join(repoRoot, "scripts", "logs");

export function repoScript(...parts: string[]) {
  return path.join(repoRoot, "scripts", ...parts);
}

export function buildLogPath(logName: string) {
  return path.join(buildLogsDir, path.basename(logName));
}

async function ensureLogsDir() {
  await fs.mkdir(buildLogsDir, { recursive: true });
}

export type RunProcessOptions = {
  cwd?: string;
  env?: NodeJS.ProcessEnv;
  stdout?: NodeJS.WritableStream;
  stderr?: NodeJS.WritableStream;
  exitOnNonZero?: boolean;
};

export async function runCommand(
  command: string,
  args: string[],
  options: RunProcessOptions = {},
) {
  return new Promise<number>((resolve, reject) => {
    const child = spawn(command, args, {
      cwd: options.cwd ?? repoRoot,
      env: options.env ?? process.env,
      windowsHide: false,
    });
    child.stdout?.pipe(options.stdout ?? process.stdout);
    child.stderr?.pipe(options.stderr ?? process.stderr);
    child.on("error", reject);
    child.on("exit", (code) => {
      const exitCode = code ?? 0;
      if (options.exitOnNonZero && exitCode !== 0) {
        process.exit(exitCode);
      }
      resolve(exitCode);
    });
  });
}

export async function runStepToLog(
  logName: string,
  label: string,
  fn: () => Promise<void>,
) {
  await touchLog(logName);
  const logPath = buildLogPath(logName);
  console.log(label);
  console.log(`Log: ${logPath}`);
  const logStream = createWriteStream(logPath, { flags: "w" });
  const origLog = console.log;
  const origErr = console.error;
  const teeLine = (line: string) => {
    logStream.write(line);
  };
  console.log = (...args: unknown[]) => {
    teeLine(`${util.format(...args)}\n`);
    origLog(...args);
  };
  console.error = (...args: unknown[]) => {
    teeLine(`${util.format(...args)}\n`);
    origErr(...args);
  };
  try {
    await fn();
  } finally {
    console.log = origLog;
    console.error = origErr;
    await new Promise<void>((resolve) => logStream.end(() => resolve()));
  }
}

export async function runMsysCommand(
  msysBash: string,
  command: string,
  options: RunProcessOptions = {},
) {
  return runCommand(msysBash, ["--login", "-c", command], {
    cwd: repoRoot,
    ...options,
  });
}

export type ProcessCapture = {
  stdout: string;
  stderr: string;
  code: number;
};

export async function touchLog(logName: string) {
  await ensureLogsDir();
  const target = buildLogPath(logName);
  await fs.writeFile(target, "");
  const now = new Date();
  await fs.utimes(target, now, now);
}

export type SpawnProcessCaptureOptions = {
  cwd?: string;
  env?: NodeJS.ProcessEnv;
  logName?: string;
  capture?: boolean;
  tee?: boolean;
  rejectOnNonZero?: boolean;
  exitOnNonZero?: boolean;
};

export async function spawnProcessAsyncCapture(
  command: string,
  args: string[] = [],
  options: SpawnProcessCaptureOptions = {},
): Promise<ProcessCapture> {
  const cwd = options.cwd ?? repoRoot;
  const logName = options.logName;
  const capture = options.capture ?? !logName;
  const tee = options.tee ?? !!logName;
  const rejectOnNonZero = options.rejectOnNonZero ?? !logName;

  let logStream: ReturnType<typeof createWriteStream> | null = null;
  if (logName) {
    await touchLog(logName);
    const logPath = buildLogPath(logName);
    console.log(`Log: ${logPath}`);
    logStream = createWriteStream(logPath, { flags: "w" });
  }

  let stdoutOutput = "";
  let stderrOutput = "";

  return new Promise((resolve, reject) => {
    const child = spawn(command, args, {
      cwd,
      env: options.env ?? process.env,
      windowsHide: false,
    });

    const handleChunk = (
      chunk: Buffer | string,
      stream: "stdout" | "stderr",
    ) => {
      const text = chunk.toString();
      if (capture && stream === "stdout") {
        stdoutOutput += text;
      }
      if (capture && stream === "stderr") {
        stderrOutput += text;
      }
      if (logStream) {
        logStream.write(chunk);
      }
      if (tee) {
        (stream === "stdout" ? process.stdout : process.stderr).write(chunk);
      }
    };

    child.stdout?.on("data", (chunk) => handleChunk(chunk, "stdout"));
    child.stderr?.on("data", (chunk) => handleChunk(chunk, "stderr"));

    child.on("error", (error) => {
      logStream?.destroy();
      reject(error);
    });

    child.on("close", (code) => {
      const result = {
        stdout: stdoutOutput,
        stderr: stderrOutput,
        code: code ?? 0,
      };
      const finish = () => {
        if (options.exitOnNonZero && result.code !== 0) {
          process.exit(result.code);
        }
        if (rejectOnNonZero && result.code !== 0) {
          reject(
            new Error(
              `Process exited with code ${result.code}: ${result.stderr}`,
            ),
          );
          return;
        }
        resolve(result);
      };
      if (logStream) {
        logStream.end(finish);
      } else {
        finish();
      }
    });
  });
}

export async function runMsysCommandToLog(
  msysBash: string,
  command: string,
  logName: string,
  options: RunProcessOptions = {},
) {
  // Piped stdio is not a TTY, so bash/make block-buffer unless we force line
  // buffering (stdbuf) and tee each chunk to the log and terminal as it arrives.
  const lineBufferedCommand = `exec stdbuf -oL -eL sh -c ${JSON.stringify(command)}`;
  const { code } = await spawnProcessAsyncCapture(
    msysBash,
    ["--login", "-c", lineBufferedCommand],
    {
      logName,
      env: {
        ...(options.env ?? process.env),
        PYTHONUNBUFFERED: "1",
      },
      capture: false,
      tee: true,
      rejectOnNonZero: false,
      exitOnNonZero: options.exitOnNonZero,
    },
  );
  return code;
}

export function spawnProcessAsync(
  command: string,
  args: string[] = [],
  options = {},
): Promise<number> {
  return new Promise((resolve, reject) => {
    const p = spawn(command, args, options);
    p.stdout?.pipe(process.stdout);
    p.stderr?.pipe(process.stderr);
    p.on("error", reject);
    p.on("exit", (code) => {
      resolve(code);
    });
  });
}

export function parsePkgArchiveFilename(filename) {
  if (!filename.endsWith(PKG_ARCHIVE_SUFFIX)) {
    return null;
  }
  const base = filename.slice(0, -PKG_ARCHIVE_SUFFIX.length);
  const archSep = base.lastIndexOf("-");
  if (archSep <= 0) {
    return null;
  }
  const arch = base.slice(archSep + 1);
  if (!PKG_ARCHES.includes(arch as (typeof PKG_ARCHES)[number])) {
    return null;
  }
  const rest = base.slice(0, archSep);
  const relSep = rest.lastIndexOf("-");
  if (relSep <= 0) {
    return null;
  }
  const pkgrel = rest.slice(relSep + 1);
  if (!/^\d+$/.test(pkgrel)) {
    return null;
  }
  const nameVer = rest.slice(0, relSep);
  const verSep = nameVer.lastIndexOf("-");
  if (verSep <= 0) {
    return null;
  }
  return {
    pkgname: nameVer.slice(0, verSep),
    pkgver: nameVer.slice(verSep + 1),
    pkgrel,
    arch,
    filename,
  };
}

export async function dedupeDistPackageDir(dist_dir, fsImpl: any = fs) {
  let names;
  try {
    names = await fsImpl.readdir(dist_dir);
  } catch (e) {
    return [];
  }

  const groups = new Map();
  for (const filename of names) {
    const parsed = parsePkgArchiveFilename(filename);
    if (!parsed) {
      continue;
    }
    const key = `${parsed.pkgname}-${parsed.arch}`;
    const full_path = path.join(dist_dir, filename);
    const stat = await fsImpl.stat(full_path);
    if (!groups.has(key)) {
      groups.set(key, []);
    }
    groups.get(key).push({ ...parsed, mtimeMs: stat.mtimeMs, full_path });
  }

  const removed = [];
  for (const files of groups.values()) {
    if (files.length <= 1) {
      continue;
    }
    files.sort((a, b) => b.mtimeMs - a.mtimeMs);
    const [, ...dupes] = files;
    for (const dupe of dupes) {
      await fsImpl.rm(dupe.full_path);
      removed.push(dupe.filename);
      console.log(`===Removed duplicate package ${dupe.filename}`);
    }
  }
  return removed;
}

export function getYYYYMMDD(date) {
  const year = date.getFullYear();
  let month = (date.getMonth() + 1).toString(); // getMonth() is zero-based
  let day = date.getDate().toString();

  // Pad month and day with a leading zero if single digit
  if (month.length < 2) month = "0" + month;
  if (day.length < 2) day = "0" + day;

  return year + month + day;
}
