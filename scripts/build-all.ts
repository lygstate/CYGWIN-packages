import * as path from "node:path";
import { createWriteStream } from "node:fs";
import { repoRoot } from "./utils.ts";
import {
  exitWith,
  runCommand,
  runMsysCommand,
  runMsysCommandToLog,
} from "./build-common.ts";

const ciToolsRoot = process.env.CI_TOOLS_ROOT || "D:\\CI-Tools";
const env: NodeJS.ProcessEnv = {
  ...process.env,
  CI_TOOLS_ROOT: ciToolsRoot,
  MSYS: "winsymlinks:native",
  MSYSTEM: "CYGWIN",
  CHERE_INVOKING: "1",
};
const pathOld = process.env.PATH || "";

const runtimePackagesInit = [
  "./dist-pkg/libiconv-devel-$LIBICONV_PKGVER-1-x86_64.pkg.tar.zst",
  "./dist-pkg/libiconv-$LIBICONV_PKGVER-1-x86_64.pkg.tar.zst",
  "./dist-pkg/libltdl-$LIBTOOL_PKGVER-$LIBTOOL_PKGREL-x86_64.pkg.tar.zst",
  "./dist-pkg/libtool-$LIBTOOL_PKGVER-$LIBTOOL_PKGREL-x86_64.pkg.tar.zst",
  "./dist-pkg/tcl-8.6.12-3-x86_64.pkg.tar.zst",
].join(" ");

const msysStage2BasicExports = "export MSYS_BOOTSTRAP_STAGE=stage2";
const rustCrossEnvs =
  "export MSYS_BOOTSTRAP_RUST=enabled; export MSYS_BOOTSTRAP_DISABLE_COPY_PACKAGES=enabled; export MSYS_BOOTSTRAP_PACKAGE_NAME_SUFFIX=cross; export MSYS_BOOTSTRAP_STAGE=stage2";
const cmdExe = process.env.COMSPEC || "C:\\Windows\\System32\\cmd.exe";
const checkBootstrap = "source scripts/sh/check-bootstrap.sh";
const buildSingle = "sh scripts/sh/single.sh";

type PipelineStep = {
  id: string;
  group: number;
  label: string;
  run: () => Promise<void>;
};

let msys64StageDir = "";
let msysBash = "";
let msysDash = "";

function initMsys64Stage(stage: "stage0" | "stage2" | "stage3") {
  msys64StageDir = path.join(ciToolsRoot, `msys64-${stage}`);
  msysBash = path.join(msys64StageDir, "msys64", "usr", "bin", "bash.exe");
  msysDash = path.join(msys64StageDir, "msys64", "usr", "bin", "dash.exe");
  env.MSYS64_STAGE_DIR = msys64StageDir;
  env.MSYS_BASH = msysBash;
  env.MSYS_DASH = msysDash;
  env.PATH = [
    path.join(ciToolsRoot, `msys64-${stage}`),
    path.join(ciToolsRoot, `msys64-${stage}`, "msys64", "usr", "bin"),
    pathOld,
  ].join(path.delimiter);
  console.log(`The ${stage} PATH is:${env.PATH}`);
}

async function extractMsys64() {
  env.CI_TOOLS_DISABLE_PAUSE = "true";
  let code = await runCommand(cmdExe, ["/c", "delete-msys64.bat"], {
    cwd: msys64StageDir,
    env,
  });
  exitWith(code);
  code = await runCommand(cmdExe, ["/c", "extract.bat"], {
    cwd: msys64StageDir,
    env,
  });
  exitWith(code);
}

async function runNodeInstall(scriptName: string, logName: string) {
  console.log(`=== Running ${scriptName} ...`);
  const logStream = createWriteStream(path.join(repoRoot, logName));
  const code = await runCommand(
    process.execPath,
    [path.join("scripts", scriptName)],
    {
      cwd: repoRoot,
      env,
      stdout: logStream,
      stderr: logStream,
    },
  );
  logStream.close();
  if (code !== 0) {
    console.log("");
    console.log(`ERROR: ${scriptName} failed with exit code ${code}`);
    console.log(`Log file: ${path.join(repoRoot, logName)}`);
    process.exit(code);
  }
}

async function installMsys2OriginalRuntime() {
  const packages = [
    "./dist-pkg/msys2-runtime-$MSYS_RUNTIME_PKGVER-$MSYS_RUNTIME_PKGREL-x86_64.pkg.tar.zst",
    "./dist-pkg/msys2-runtime-devel-$MSYS_RUNTIME_PKGVER-$MSYS_RUNTIME_PKGREL-x86_64.pkg.tar.zst",
  ].join(" ");
  exitWith(
    await runMsysCommand(
      msysBash,
      `${checkBootstrap}; pacman -U --noconfirm --overwrite \\* ${packages}`,
      env,
    ),
  );
  exitWith(
    await runMsysCommand(
      msysBash,
      `${checkBootstrap}; pacman -U --noconfirm --overwrite \\* ${runtimePackagesInit}`,
      env,
    ),
  );
}

async function installMsys2HookRuntime() {
  const packages = [
    "./dist/init/msys2-runtime-$MSYS_RUNTIME_PKGVER-5-x86_64.pkg.tar.zst",
    "./dist/init/msys2-runtime-devel-$MSYS_RUNTIME_PKGVER-5-x86_64.pkg.tar.zst",
  ].join(" ");
  exitWith(
    await runMsysCommand(
      msysBash,
      `${checkBootstrap}; pacman -U --noconfirm --overwrite \\* ${packages}`,
      env,
    ),
  );
  exitWith(
    await runMsysCommand(
      msysBash,
      `${checkBootstrap}; pacman -U --noconfirm --overwrite \\* ${runtimePackagesInit}`,
      env,
    ),
  );
}

async function rebaseallMsys64Stage2() {
  console.log("stage2: Do rebaseall -p for rust native");
  // Stage2 rebaseall must match the old :rebaseall_msys64_stage2_p intent, but
  // the old batch always "exit /B 0" and never checked rebaseall errorlevel, so
  // failures were silent on rebase 4.5+ (Invalid Baseaddress 0x70000000).
  //
  // Clear MSYS/MSYSTEM/CHERE_INVOKING so rebaseall uses the mingw file-list path
  // (find /usr/bin and /usr/lib). Keeping MSYSTEM=CYGWIN uses the cygwin path
  // (/etc/setup/*.lst.gz), which this bootstrap tree lacks; only addon DLLs get
  // listed and database-mode rebase can fail with "Too many DLLs for available
  // address space" when /etc/rebase.db.x86_64 is stale.
  //
  // Cleared MSYSTEM makes uname report MINGW64_NT, so rebaseall keeps legacy
  // DefaultBaseAddress=0x70000000. On x86_64 that is rejected (must be >
  // 0x200000000). Pass -b 0x400000000 explicitly: that is the x86_64 cygwin
  // default from /usr/bin/rebaseall, applied only when platform is cygwin|msys.
  //
  // Remove /etc/rebase.db.x86_64 before and after (before avoids stale-db merge
  // errors; after matches the old batch). -p skips the dash-only process check.
  exitWith(await runMsysCommand(msysBash, "rm -rf /etc/rebase.db.x86_64", env));
  const rebaseEnv = { ...env, MSYS: "", MSYSTEM: "", CHERE_INVOKING: "" };
  exitWith(
    await runCommand(msysDash, ["/usr/bin/rebaseall", "-p", "-b", "0x400000000"], {
      env: rebaseEnv,
    }),
  );
  exitWith(await runMsysCommand(msysBash, "rm -rf /etc/rebase.db.x86_64", env));
}

const pipeline: PipelineStep[] = [
  {
    id: "stage0-prep",
    group: 1,
    label: "stage0 prep",
    run: async () => {
      console.log("Preparing msys64 for stage0 by install all packages msys repo");
      await runNodeInstall("install-for-stage0.ts", "install-for-stage0.txt");
      initMsys64Stage("stage0");
      await extractMsys64();
    },
  },
  {
    id: "hook-runtime",
    group: 2,
    label: "hook/runtime builds",
    run: async () => {
      initMsys64Stage("stage0");
      console.log("Building original and hook patched msys2-runtime");
      await installMsys2OriginalRuntime();
      exitWith(
        await runMsysCommandToLog(
          msysBash,
          "source scripts/sh/stage-hook.sh",
          "build-stage-hook.txt",
          env,
        ),
      );
      initMsys64Stage("stage0");
      await installMsys2HookRuntime();
      exitWith(
        await runMsysCommandToLog(
          msysBash,
          "source scripts/sh/stage0.sh",
          "build-stage0.txt",
          env,
        ),
      );
    },
  },
  {
    id: "stage1",
    group: 3,
    label: "stage1",
    run: async () => {
      initMsys64Stage("stage0");
      exitWith(
        await runMsysCommandToLog(
          msysBash,
          "source scripts/sh/stage1.sh",
          "build-stage1.txt",
          env,
        ),
      );
    },
  },
  {
    id: "stage2-prep",
    group: 4,
    label: "stage2 prep",
    run: async () => {
      initMsys64Stage("stage2");
      console.log("Preparing msys64 for stage2 by install packages built by stage1");
      await runNodeInstall("install-for-stage2.ts", "install-for-stage2.txt");
    },
  },
  {
    id: "stage2-gcc",
    group: 5,
    label: "stage2 gcc",
    run: async () => {
      initMsys64Stage("stage2");
      console.log("Building gcc bootstrap for stage2");
      exitWith(
        await runMsysCommand(
          msysBash,
          `${msysStage2BasicExports}; ${checkBootstrap}; ${buildSingle} gcc >build-stage2-gcc.txt 2>&1`,
          env,
        ),
      );
    },
  },
  {
    id: "stage2-rust-cross",
    group: 5,
    label: "stage2 rust cross",
    run: async () => {
      initMsys64Stage("stage2");
      console.log("Building rust cross for stage2");
      exitWith(
        await runMsysCommand(
          msysBash,
          `${rustCrossEnvs}; ${checkBootstrap}; ${buildSingle} rust >build-stage2-rust-cross.txt 2>&1`,
          env,
        ),
      );
    },
  },
  {
    id: "stage2-rebaseall",
    group: 5,
    label: "stage2 rebaseall (before rust native)",
    run: async () => {
      initMsys64Stage("stage2");
      await rebaseallMsys64Stage2();
    },
  },
  {
    id: "stage2-rust-native",
    group: 5,
    label: "stage2 rust native",
    run: async () => {
      initMsys64Stage("stage2");
      console.log("Building rust native before rebaseall list for stage2");
      exitWith(
        await runMsysCommand(
          msysBash,
          `${msysStage2BasicExports}; ${checkBootstrap}; ${buildSingle} rust >build-stage2-rust-native.txt 2>&1`,
          env,
        ),
      );
    },
  },
  {
    id: "stage2-rebaseall-2",
    group: 5,
    label: "stage2 rebaseall (after rust native)",
    run: async () => {
      initMsys64Stage("stage2");
      await rebaseallMsys64Stage2();
    },
  },
  {
    id: "stage2-cargo",
    group: 5,
    label: "stage2 cargo-c",
    run: async () => {
      initMsys64Stage("stage2");
      console.log("Building the cargo by native");
      exitWith(
        await runMsysCommand(
          msysBash,
          `${msysStage2BasicExports}; ${checkBootstrap}; ${buildSingle} cargo-c >build-stage2-cargo-native.txt 2>&1`,
          env,
        ),
      );
    },
  },
  {
    id: "stage2-lists",
    group: 6,
    label: "stage2 package lists",
    run: async () => {
      initMsys64Stage("stage2");
      console.log("Building the rest packages");
      exitWith(
        await runMsysCommandToLog(
          msysBash,
          `${msysStage2BasicExports}; ${checkBootstrap}; sh scripts/sh/stage2-list.sh`,
          "build-stage2.txt",
          env,
        ),
      );
    },
  },
  {
    id: "stage2-list-extra",
    group: 6,
    label: "stage2 package list extra",
    run: async () => {
      initMsys64Stage("stage2");
      exitWith(
        await runMsysCommandToLog(
          msysBash,
          `${msysStage2BasicExports}; ${checkBootstrap}; sh scripts/sh/stage2-list-extra.sh`,
          "build-stage2-list-extra.txt",
          env,
        ),
      );
    },
  },
  {
    id: "stage3-prep",
    group: 7,
    label: "stage3 prep (cygwin packages + archive)",
    run: async () => {
      console.log("Preparing msys64 for stage3 by install packages built by stage1 and stage2");
      initMsys64Stage("stage3");
      await runNodeInstall("install-for-stage3.ts", "install-for-stage3.txt");
    },
  },
  {
    id: "stage3-mingw",
    group: 8,
    label: "stage3 extract + mingw packages",
    run: async () => {
      initMsys64Stage("stage3");
      console.log("Extracting stage3 MSYS2 from archive before mingw install");
      await extractMsys64();
      await runNodeInstall(
        "install-mingw-for-stage3.ts",
        "install-mingw-for-stage3.txt",
      );
    },
  },
];

function resolveFromStep(fromArg: string): string {
  if (/^[1-8]$/.test(fromArg)) {
    const group = Number(fromArg);
    const step = pipeline.find((item) => item.group === group);
    if (!step) {
      throw new Error(`No pipeline step for group ${group}`);
    }
    return step.id;
  }
  return fromArg;
}

function findStepIndex(fromId: string) {
  const index = pipeline.findIndex((item) => item.id === fromId);
  if (index >= 0) {
    return index;
  }
  return -1;
}

function printHelp() {
  console.log(`Usage: start.bat [--from <step>] [--help]

Run the MSYS2/Cygwin bootstrap pipeline from the beginning or from a step.

Options:
  -h, --help           Show this help and exit
  --from <step>        Start at <step> and run through the end

Environment:
  CI_TOOLS_ROOT        CI tools root (default: D:\\CI-Tools)

Pipeline groups:
  1. stage0 prep
  2. hook/runtime builds
  3. stage1
  4. stage2 prep
  5. stage2 gcc/rust/cargo
  6. stage2 package lists
  7. stage3 prep (cygwin + archive)
  8. stage3 extract + mingw

Steps (--from accepts the id or group number 1-8):
`);
  for (const step of pipeline) {
    console.log(`  ${step.group}. ${step.id.padEnd(20)} ${step.label}`);
  }
  console.log(`
Examples:
  start.bat
  start.bat --from 4
  start.bat --from stage2-gcc
  start.bat --from stage2-rust-native
  start.bat --from stage3-mingw

More detail: BUILD-START.md
`);
}

function parseArgs(argv: string[]) {
  let fromStep: string | null = null;

  for (let i = 0; i < argv.length; i += 1) {
    const arg = argv[i];
    if (arg === "--help" || arg === "-h") {
      printHelp();
      process.exit(0);
    }
    if (arg === "--from") {
      const value = argv[i + 1];
      if (!value) {
        console.error("Missing value for --from");
        console.error("Run start.bat --help for usage.");
        process.exit(1);
      }
      fromStep = resolveFromStep(value);
      i += 1;
      continue;
    }
    console.error(`Unknown argument: ${arg}`);
    console.error("Run start.bat --help for usage.");
    process.exit(1);
  }

  return { fromStep };
}

async function main() {
  const { fromStep } = parseArgs(process.argv.slice(2));
  console.log(`CI_TOOLS_ROOT is: ${ciToolsRoot}`);

  let startIndex = 0;
  if (fromStep) {
    startIndex = findStepIndex(fromStep);
    if (startIndex < 0) {
      console.error(`Unknown pipeline step: ${fromStep}`);
      console.error("Run start.bat --help for the step list.");
      process.exit(1);
    }
    console.log(
      `Starting pipeline at step ${startIndex + 1}/${pipeline.length}: ${pipeline[startIndex].id}`,
    );
  }

  for (let i = startIndex; i < pipeline.length; i += 1) {
    const step = pipeline[i];
    console.log(`=== Pipeline step ${i + 1}/${pipeline.length}: ${step.id}`);
    await step.run();
  }
}

main().catch((error) => {
  console.error(error);
  process.exit(1);
});
