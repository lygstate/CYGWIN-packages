import { spawn } from "node:child_process";
import { createWriteStream } from "node:fs";
import * as fs from "node:fs/promises";
import * as path from "node:path";
import { fileURLToPath } from "node:url";
import util from "node:util";

const repoRoot = path.resolve(
  path.dirname(fileURLToPath(import.meta.url)),
  "..",
);

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
