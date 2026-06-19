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
  const stream = createWriteStream(path.join(repoRoot, logFile));
  const code = await runCommand(msysBash, ["--login", "-c", command], {
    cwd: repoRoot,
    env,
    stdout: stream,
    stderr: stream,
  });
  stream.close();
  return code;
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
