import { spawn, type SpawnOptions } from "child_process";
import { createWriteStream } from "node:fs";
import * as fs from "fs/promises";
import * as path from "path";
import util from "node:util";

export class RunContext {
  logPath: string;
  label: string;
  logStream: NodeJS.WritableStream | null;
  logOptions: RunProcessLogOptions;

  constructor(
    logPath: string,
    label: string,
    logOptions: RunProcessLogOptions = {},
    logStream: NodeJS.WritableStream | null = null,
  ) {
    this.logPath = logPath;
    this.label = label;
    this.logStream = logStream;
    this.logOptions = {
      teeConsole: false,
      capture: true,
      exitOnNonZero: false,
      ...logOptions,
    };
  }

  // Not safe to call step() concurrently: it patches global console.log/error.
  // start.ts runs one RunContext at a time; parallel use needs per-session logging.
  async step(fn: (step: RunContext) => Promise<void>) {
    const origLog = console.log;
    const origErr = console.error;
    if (!this.logStream) {
      await fs.mkdir(path.dirname(this.logPath), { recursive: true });
      this.logStream = createWriteStream(this.logPath, {
        flags: "w",
      });
    }
    const teeLine = (line: string) => {
      this.logStream!.write(line);
    };
    const logToFileAndConsole = (...args: unknown[]) => {
      teeLine(`${util.format(...args)}\n`);
      origLog(...args);
    };
    const logErrorToFileAndConsole = (...args: unknown[]) => {
      teeLine(`${util.format(...args)}\n`);
      origErr(...args);
    };
    try {
      console.log = (...args: unknown[]) => {
        teeLine(`${util.format(...args)}\n`);
        if (this.logOptions.teeConsole) {
          origLog(...args);
        }
      };
      console.error = (...args: unknown[]) => {
        teeLine(`${util.format(...args)}\n`);
        if (this.logOptions.teeConsole) {
          origErr(...args);
        }
      };
      logToFileAndConsole(this.label);
      logToFileAndConsole(`Log: ${this.logPath}`);
      await fn(this);
    } catch (error) {
      logToFileAndConsole("");
      logToFileAndConsole(`ERROR: ${this.label} failed`);
      logToFileAndConsole(`Log file: ${this.logPath}`);
      logErrorToFileAndConsole(error);
      process.exit(1);
    } finally {
      const logStream = this.logStream;
      this.logStream = null;
      console.log = origLog;
      console.error = origErr;
      if (logStream) {
        await new Promise<void>((resolve) => logStream.end(() => resolve()));
      }
    }
  }

  run(
    command: string,
    args: string[] = [],
    options: RunProcessOptions = {},
  ) {
    return runProcess(command, args, options, this.logStream, this.logOptions);
  }
}

export type ProcessRunner = Pick<RunContext, "run">;

type ProcessCapture = {
  stdout: string;
  stderr: string;
  code: number;
};

export type RunProcessOptions = SpawnOptions & {
  capture?: boolean;
  stdout?: NodeJS.WritableStream;
  stderr?: NodeJS.WritableStream;
};

export type RunProcessLogOptions = {
  teeConsole?: boolean;
  capture?: boolean;
  exitOnNonZero?: boolean;
};

async function runProcess(
  command: string,
  args: string[] = [],
  options: RunProcessOptions = {},
  logStream: NodeJS.WritableStream | null = null,
  logOptions: RunProcessLogOptions = {},
): Promise<ProcessCapture> {
  const {
    capture: captureOverride,
    stdout,
    stderr,
    ...spawnOptions
  } = options;
  const {
    teeConsole = false,
    capture: stepCapture = true,
    exitOnNonZero = false,
  } = logOptions;
  const cwd = spawnOptions.cwd ?? process.cwd();
  const env = spawnOptions.env ?? process.env;
  const capture = captureOverride ?? stepCapture;
  const tee = teeConsole && !capture;

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
