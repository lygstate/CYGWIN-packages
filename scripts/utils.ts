import { spawn, type SpawnOptions } from "child_process";
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

export class LoggedStep {
  logStream: NodeJS.WritableStream | null = null;

  constructor(
    readonly logName: string,
    readonly label: string,
  ) {}

  async run(fn: (step: LoggedStep) => Promise<void>) {
    await touchLog(this.logName);
    const logPath = buildLogPath(this.logName);
    console.log(this.label);
    console.log(`Log: ${logPath}`);
    const logStream = createWriteStream(logPath, { flags: "w" });
    this.logStream = logStream;
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
      await fn(this);
    } catch (error) {
      console.log("");
      console.log(`ERROR: ${this.label} failed`);
      console.log(`Log file: ${buildLogPath(this.logName)}`);
      console.error(error);
      process.exit(1);
    } finally {
      this.logStream = null;
      console.log = origLog;
      console.error = origErr;
      await new Promise<void>((resolve) => logStream.end(() => resolve()));
    }
  }

  runProcess(
    command: string,
    args: string[] = [],
    options: RunProcessOptions = {},
  ) {
    return runProcess(command, args, {
      ...options,
      logStream: this.logStream ?? options.logStream,
    });
  }
}

export type ProcessCapture = {
  stdout: string;
  stderr: string;
  code: number;
};

export async function touchLog(logName: string) {
  await fs.mkdir(buildLogsDir, { recursive: true });
  const target = buildLogPath(logName);
  await fs.writeFile(target, "");
  const now = new Date();
  await fs.utimes(target, now, now);
}

export type RunProcessOptions = SpawnOptions & {
  capture?: boolean;
  tee?: boolean;
  exitOnNonZero?: boolean;
  stdout?: NodeJS.WritableStream;
  stderr?: NodeJS.WritableStream;
  logStream?: NodeJS.WritableStream;
};

export async function runProcess(
  command: string,
  args: string[] = [],
  options: RunProcessOptions = {},
): Promise<ProcessCapture> {
  const {
    capture: captureOption,
    tee: teeOption,
    exitOnNonZero,
    stdout,
    stderr,
    logStream,
    ...spawnOptions
  } = options;
  const cwd = spawnOptions.cwd ?? repoRoot;
  const env = spawnOptions.env ?? process.env;
  const capture = captureOption ?? true;
  const tee = teeOption ?? false;

  let stdoutOutput = "";
  let stderrOutput = "";

  return new Promise((resolve) => {
    let settled = false;
    let child: ReturnType<typeof spawn>;

    const finish = (result: ProcessCapture) => {
      if (settled) {
        return;
      }
      settled = true;
      const finishResolve = () => {
        if (exitOnNonZero && result.code !== 0) {
          process.exit(result.code);
        }
        resolve(result);
      };
      finishResolve();
    };

    try {
      child = spawn(command, args, {
        ...spawnOptions,
        cwd,
        env,
        windowsHide: false,
      });
    } catch (error) {
      finish({
        stdout: stdoutOutput,
        stderr: String(error),
        code: 1,
      });
      return;
    }

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
      const outputStream = stream === "stdout" ? stdout : stderr;
      if (outputStream) {
        outputStream.write(chunk);
      }
      if (tee) {
        (stream === "stdout" ? process.stdout : process.stderr).write(chunk);
      }
    };

    child.stdout?.on("data", (chunk) => handleChunk(chunk, "stdout"));
    child.stderr?.on("data", (chunk) => handleChunk(chunk, "stderr"));

    child.on("error", (error) => {
      const text = `${String(error)}\n`;
      stderrOutput += text;
      if (logStream) {
        logStream.write(text);
      }
      if (stderr) {
        stderr.write(text);
      }
      if (tee) {
        process.stderr.write(text);
      }
      finish({
        stdout: stdoutOutput,
        stderr: stderrOutput,
        code: 1,
      });
    });

    child.on("close", (code) => {
      finish({
        stdout: stdoutOutput,
        stderr: stderrOutput,
        code: code ?? 0,
      });
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
