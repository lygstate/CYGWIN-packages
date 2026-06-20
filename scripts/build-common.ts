import { spawn } from "node:child_process";
import { createWriteStream } from "node:fs";
import * as fs from "node:fs/promises";
import * as path from "node:path";
import util from "node:util";
import { repoRoot } from "./utils.ts";

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

export async function runCommand(
  command: string,
  args: string[],
  options: {
    cwd?: string;
    env?: NodeJS.ProcessEnv;
    stdout?: NodeJS.WritableStream;
    stderr?: NodeJS.WritableStream;
  } = {},
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
    child.on("exit", (code) => resolve(code ?? 0));
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
  env: NodeJS.ProcessEnv = process.env,
) {
  return runCommand(msysBash, ["--login", "-c", command], {
    cwd: repoRoot,
    env,
  });
}

export async function runMsysCommandToLog(
  msysBash: string,
  command: string,
  logName: string,
  env: NodeJS.ProcessEnv = process.env,
) {
  await touchLog(logName);
  const logPath = buildLogPath(logName);
  console.log(`Log: ${logPath}`);
  const logStream = createWriteStream(logPath, { flags: "w" });
  // Piped stdio is not a TTY, so bash/make block-buffer unless we force line
  // buffering (stdbuf) and tee each chunk to the log and terminal as it arrives.
  const lineBufferedCommand = `exec stdbuf -oL -eL sh -c ${JSON.stringify(command)}`;

  return new Promise<number>((resolve, reject) => {
    const child = spawn(msysBash, ["--login", "-c", lineBufferedCommand], {
      cwd: repoRoot,
      env: {
        ...env,
        PYTHONUNBUFFERED: "1",
      },
      windowsHide: false,
    });

    const tee = (chunk: Buffer | string, output: NodeJS.WriteStream) => {
      logStream.write(chunk);
      output.write(chunk);
    };

    child.stdout?.on("data", (chunk) => tee(chunk, process.stdout));
    child.stderr?.on("data", (chunk) => tee(chunk, process.stderr));

    child.on("error", (error) => {
      logStream.destroy();
      reject(error);
    });
    child.on("close", (code) => {
      logStream.end(() => resolve(code ?? 0));
    });
  });
}

export async function touchLog(logName: string) {
  await ensureLogsDir();
  const target = buildLogPath(logName);
  await fs.writeFile(target, "");
  const now = new Date();
  await fs.utimes(target, now, now);
}

export function exitWith(code: number) {
  if (code !== 0) {
    process.exit(code);
  }
}
