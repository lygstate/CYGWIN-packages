import { spawn, type SpawnOptions } from "child_process";
import { createWriteStream } from "node:fs";
import * as fs from "fs/promises";
import * as path from "path";
import util from "node:util";

export class RunContext {
  logStream: NodeJS.WritableStream | null = null;
  logPath: string;
  label: string;

  constructor(logPath: string, label: string) {
    this.logPath = logPath;
    this.label = label;
  }

  // Not safe to call step() concurrently: it patches global console.log/error.
  // build-all runs one RunContext at a time; parallel use needs per-session logging.
  async step(fn: (step: RunContext) => Promise<void>) {
    const origLog = console.log;
    const origErr = console.error;
    let logStream: ReturnType<typeof createWriteStream> | null = null;
    try {
      await fs.mkdir(path.dirname(this.logPath), { recursive: true });
      logStream = createWriteStream(this.logPath, { flags: "w" });
      this.logStream = logStream;
      const teeLine = (line: string) => {
        logStream!.write(line);
      };
      console.log = (...args: unknown[]) => {
        teeLine(`${util.format(...args)}\n`);
        origLog(...args);
      };
      console.error = (...args: unknown[]) => {
        teeLine(`${util.format(...args)}\n`);
        origErr(...args);
      };
      console.log(this.label);
      console.log(`Log: ${this.logPath}`);
      await fn(this);
    } catch (error) {
      console.log("");
      console.log(`ERROR: ${this.label} failed`);
      console.log(`Log file: ${this.logPath}`);
      console.error(error);
      process.exit(1);
    } finally {
      this.logStream = null;
      console.log = origLog;
      console.error = origErr;
      if (logStream) {
        await new Promise<void>((resolve) => logStream!.end(() => resolve()));
      }
    }
  }

  run(
    command: string,
    args: string[] = [],
    options: RunProcessOptions = {},
  ) {
    return runProcess(command, args, options, { logStream: this.logStream });
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
  tee?: boolean;
  exitOnNonZero?: boolean;
  stdout?: NodeJS.WritableStream;
  stderr?: NodeJS.WritableStream;
};

type RunProcessLogOptions = {
  logStream?: NodeJS.WritableStream | null;
};

async function runProcess(
  command: string,
  args: string[] = [],
  options: RunProcessOptions = {},
  logOptions: RunProcessLogOptions = {},
): Promise<ProcessCapture> {
  const {
    capture: captureOption,
    tee: teeOption,
    exitOnNonZero,
    stdout,
    stderr,
    ...spawnOptions
  } = options;
  const { logStream } = logOptions;
  const cwd = spawnOptions.cwd ?? process.cwd();
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
