import { spawn } from "node:child_process";
import { createWriteStream } from "node:fs";
import * as fs from "node:fs/promises";
import * as path from "node:path";
import { repoRoot } from "./utils.ts";

export function repoScript(...parts: string[]) {
  return path.join(repoRoot, "scripts", ...parts);
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

export async function runShellFile(
  scriptPath: string,
  args: string[] = [],
  env: NodeJS.ProcessEnv = process.env,
) {
  const shell = env.MSYS_BASH || env.SHELL || "/usr/bin/bash";
  return runCommand(shell, [scriptPath, ...args], { cwd: repoRoot, env });
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
  logFile: string,
  env: NodeJS.ProcessEnv = process.env,
) {
  await touchLog(logFile);
  const logPath = path.join(repoRoot, logFile);
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

export async function touchLog(logFile: string) {
  const target = path.join(repoRoot, logFile);
  await fs.writeFile(target, "");
  const now = new Date();
  await fs.utimes(target, now, now);
}

export function exitWith(code: number) {
  if (code !== 0) {
    process.exit(code);
  }
}
