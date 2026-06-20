import * as path from "node:path";
import { runDeps } from "./deps.ts";
import { runGenBuildAll } from "./gen-build-all.ts";
import {
  installStage0,
  installStage2,
  installStage3,
  installMingwStage3,
} from "./install-stages.ts";
import {
  RunContext,
  type RunProcessLogOptions,
  type RunProcessOptions,
} from "./run-context.ts";
import { repoPath } from "./utils.ts";

process.on("SIGINT", () => {
  console.log("Caught interrupt signal");
  process.exit(130);
});

const ciToolsRoot = process.env.CI_TOOLS_ROOT || "D:\\CI-Tools";
const pathOld = process.env.PATH || "";
const cmdExe = process.env.COMSPEC || "C:\\Windows\\System32\\cmd.exe";
const systemRoot = process.env.SystemRoot || "C:\\Windows";

type Msys64Stage = {
  stageDir: string;
  bash: string;
  dash: string;
  env: NodeJS.ProcessEnv;
};

function msys64StageEnv(stage: "stage0" | "stage2" | "stage3"): Msys64Stage {
  const stageDir = path.join(ciToolsRoot, `msys64-${stage}`);
  const bash = path.join(stageDir, "msys64", "usr", "bin", "bash.exe");
  const dash = path.join(stageDir, "msys64", "usr", "bin", "dash.exe");
  return {
    stageDir,
    bash,
    dash,
    env: {
      ...process.env,
      CI_TOOLS_ROOT: ciToolsRoot,
      MSYS: "winsymlinks:native",
      MSYSTEM: "CYGWIN",
      CHERE_INVOKING: "1",
      MSYS64_STAGE_DIR: stageDir,
      MSYS_BASH: bash,
      MSYS_DASH: dash,
      PATH: [
        stageDir,
        path.join(stageDir, "msys64", "usr", "bin"),
        pathOld,
      ].join(path.delimiter),
    },
  };
}

function winBatchEnv(): NodeJS.ProcessEnv {
  const batchEnv: NodeJS.ProcessEnv = {
    ...process.env,
    CI_TOOLS_ROOT: ciToolsRoot,
    PATH: [path.join(systemRoot, "System32"), pathOld].join(path.delimiter),
  };
  delete batchEnv.MSYSTEM;
  delete batchEnv.MSYS;
  delete batchEnv.CHERE_INVOKING;
  delete batchEnv.MSYS64_STAGE_DIR;
  delete batchEnv.MSYS_BASH;
  delete batchEnv.MSYS_DASH;
  return batchEnv;
}

function initMsys64Stage(stage: "stage0" | "stage2" | "stage3"): Msys64Stage {
  const stagePaths = msys64StageEnv(stage);
  console.log(`The ${stage} PATH is:${stagePaths.env.PATH}`);
  return stagePaths;
}
const msysStage2BasicExports = "export MSYS_BOOTSTRAP_STAGE=stage2";
const rustCrossEnvs =
  "export MSYS_BOOTSTRAP_RUST=enabled; export MSYS_BOOTSTRAP_DISABLE_COPY_PACKAGES=enabled; export MSYS_BOOTSTRAP_PACKAGE_NAME_SUFFIX=cross; export MSYS_BOOTSTRAP_STAGE=stage2";
const runtimePackagesInit = [
  "./dist-pkg/libiconv-devel-$LIBICONV_PKGVER-1-x86_64.pkg.tar.zst",
  "./dist-pkg/libiconv-$LIBICONV_PKGVER-1-x86_64.pkg.tar.zst",
  "./dist-pkg/libltdl-$LIBTOOL_PKGVER-$LIBTOOL_PKGREL-x86_64.pkg.tar.zst",
  "./dist-pkg/libtool-$LIBTOOL_PKGVER-$LIBTOOL_PKGREL-x86_64.pkg.tar.zst",
  "./dist-pkg/tcl-8.6.12-3-x86_64.pkg.tar.zst",
].join(" ");

const checkBootstrap = "source scripts/sh/check-bootstrap.sh";
const buildSingle = "sh scripts/sh/single.sh";

function runContext(
  logName: string,
  label: string,
  logOptions: RunProcessLogOptions = {},
) {
  return new RunContext(
    repoPath("scripts", "logs", logName),
    label,
    {
      capture: false,
      exitOnNonZero: true,
      ...logOptions,
    },
  );
}

type PipelineStep = {
  id: string;
  group: number;
  label: string;
  run: () => Promise<void>;
};

async function extractMsys64(step: RunContext, stage: Msys64Stage) {
  const batchOpts: RunProcessOptions = {
    cwd: stage.stageDir,
    env: {
      ...winBatchEnv(),
      CI_TOOLS_DISABLE_PAUSE: "true",
    },
  };
  await step.run(cmdExe, ["/c", "delete-msys64.bat"], batchOpts);
  await step.run(cmdExe, ["/c", "extract.bat"], batchOpts);
}

async function runMsysBuild(
  logName: string,
  command: string,
  stage: Msys64Stage,
) {
  // Piped stdio is not a TTY, so bash/make block-buffer unless we force line
  // buffering (stdbuf) so log file output arrives incrementally.
  const lineBufferedCommand = `exec stdbuf -oL -eL sh -c ${JSON.stringify(command)}`;
  await runContext(logName, command).step(async (step) => {
    await step.run(stage.bash, ["--login", "-c", lineBufferedCommand], {
      env: {
        ...stage.env,
        PYTHONUNBUFFERED: "1",
      },
    });
  });
}

async function installMsys2OriginalRuntime(step: RunContext, stage: Msys64Stage) {
  const packages = [
    "./dist-pkg/msys2-runtime-$MSYS_RUNTIME_PKGVER-$MSYS_RUNTIME_PKGREL-x86_64.pkg.tar.zst",
    "./dist-pkg/msys2-runtime-devel-$MSYS_RUNTIME_PKGVER-$MSYS_RUNTIME_PKGREL-x86_64.pkg.tar.zst",
  ].join(" ");
  const runOpts: RunProcessOptions = { env: stage.env };
  await step.run(
    stage.bash,
    ["--login", "-c", `${checkBootstrap}; pacman -U --noconfirm --overwrite \\* ${packages}`],
    runOpts,
  );
  await step.run(
    stage.bash,
    ["--login", "-c", `${checkBootstrap}; pacman -U --noconfirm --overwrite \\* ${runtimePackagesInit}`],
    runOpts,
  );
}

async function installMsys2HookRuntime(step: RunContext, stage: Msys64Stage) {
  const packages = [
    "./dist/init/msys2-runtime-$MSYS_RUNTIME_PKGVER-5-x86_64.pkg.tar.zst",
    "./dist/init/msys2-runtime-devel-$MSYS_RUNTIME_PKGVER-5-x86_64.pkg.tar.zst",
  ].join(" ");
  const runOpts: RunProcessOptions = { env: stage.env };
  await step.run(
    stage.bash,
    ["--login", "-c", `${checkBootstrap}; pacman -U --noconfirm --overwrite \\* ${packages}`],
    runOpts,
  );
  await step.run(
    stage.bash,
    ["--login", "-c", `${checkBootstrap}; pacman -U --noconfirm --overwrite \\* ${runtimePackagesInit}`],
    runOpts,
  );
}

async function rebaseallMsys64Stage2(step: RunContext, stage: Msys64Stage) {
  console.log("Run rebaseall -p (rebase DLLs for stage2)");
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
  const runOpts: RunProcessOptions = { env: stage.env };
  await step.run(stage.bash, ["--login", "-c", "rm -rf /etc/rebase.db.x86_64"], runOpts);
  await step.run(stage.dash, ["/usr/bin/rebaseall", "-p", "-b", "0x400000000"], {
    env: { ...stage.env, MSYS: "", MSYSTEM: "", CHERE_INVOKING: "" },
  });
  await step.run(stage.bash, ["--login", "-c", "rm -rf /etc/rebase.db.x86_64"], runOpts);
}

const pipeline: PipelineStep[] = [
  {
    id: "stage0-install",
    group: 1,
    label: "stage0 install MSYS packages",
    run: async () => {
      await runContext(
        "install-for-stage0.txt",
        "Install MSYS base packages into msys64-stage0",
      ).step(installStage0);
    },
  },
  {
    id: "stage0-deps",
    group: 2,
    label: "stage0 generate deps.json",
    run: async () => {
      initMsys64Stage("stage0");
      await runContext(
        "deps.txt",
        "Generate scripts/generated/deps.json (deps.ts)",
      ).step(runDeps);
    },
  },
  {
    id: "stage0-gen-build-all",
    group: 2,
    label: "stage0 generate stage1/stage2 package lists",
    run: async () => {
      await runContext(
        "gen-build-all.txt",
        "Generate stage1/stage2 package lists (gen-build-all.ts)",
      ).step(runGenBuildAll);
    },
  },
  {
    id: "stage0-extract",
    group: 3,
    label: "stage0 extract archive",
    run: async () => {
      const stage = initMsys64Stage("stage0");
      await runContext(
        "extract-stage0.txt",
        "Extract msys64-stage0 from archive",
      ).step((step) => extractMsys64(step, stage));
    },
  },
  {
    id: "hook-runtime",
    group: 4,
    label: "hook/runtime builds",
    run: async () => {
      let stage = initMsys64Stage("stage0");
      await runContext(
        "install-original-runtime.txt",
        "Install original msys2-runtime packages",
      ).step((step) => installMsys2OriginalRuntime(step, stage));
      console.log("Build hook-patched msys2-runtime (stage-hook.sh)");
      await runMsysBuild(
        "build-stage-hook.txt",
        "source scripts/sh/stage-hook.sh",
        stage,
      );
      stage = initMsys64Stage("stage0");
      await runContext(
        "install-hook-runtime.txt",
        "Install hook-patched msys2-runtime packages",
      ).step((step) => installMsys2HookRuntime(step, stage));
      console.log("Build stage0 bootstrap packages (stage0.sh)");
      await runMsysBuild("build-stage0.txt", "source scripts/sh/stage0.sh", stage);
    },
  },
  {
    id: "stage1",
    group: 5,
    label: "stage1",
    run: async () => {
      const stage = initMsys64Stage("stage0");
      console.log("Build stage1 packages (stage1.sh)");
      await runMsysBuild("build-stage1.txt", "source scripts/sh/stage1.sh", stage);
    },
  },
  {
    id: "stage2-prep",
    group: 6,
    label: "stage2 prep",
    run: async () => {
      initMsys64Stage("stage2");
      await runContext(
        "install-for-stage2.txt",
        "Install stage1-built packages into msys64-stage2",
      ).step(installStage2);
    },
  },
  {
    id: "stage2-gcc",
    group: 7,
    label: "stage2 gcc",
    run: async () => {
      const stage = initMsys64Stage("stage2");
      console.log("Build gcc for stage2 (single.sh gcc)");
      await runMsysBuild(
        "build-stage2-gcc.txt",
        `${msysStage2BasicExports}; ${checkBootstrap}; ${buildSingle} gcc`,
        stage,
      );
    },
  },
  {
    id: "stage2-rust-cross",
    group: 7,
    label: "stage2 rust cross",
    run: async () => {
      const stage = initMsys64Stage("stage2");
      console.log("Build rust cross toolchain for stage2 (single.sh rust)");
      await runMsysBuild(
        "build-stage2-rust-cross.txt",
        `${rustCrossEnvs}; ${checkBootstrap}; ${buildSingle} rust`,
        stage,
      );
    },
  },
  {
    id: "stage2-rebaseall",
    group: 7,
    label: "stage2 rebaseall (before rust native)",
    run: async () => {
      const stage = initMsys64Stage("stage2");
      await runContext(
        "rebaseall-stage2-before-rust-native.txt",
        "Run rebaseall -p before rust native",
      ).step((step) => rebaseallMsys64Stage2(step, stage));
    },
  },
  {
    id: "stage2-rust-native",
    group: 7,
    label: "stage2 rust native",
    run: async () => {
      const stage = initMsys64Stage("stage2");
      console.log("Build rust native for stage2 (single.sh rust)");
      await runMsysBuild(
        "build-stage2-rust-native.txt",
        `${msysStage2BasicExports}; ${checkBootstrap}; ${buildSingle} rust`,
        stage,
      );
    },
  },
  {
    id: "stage2-rebaseall-2",
    group: 7,
    label: "stage2 rebaseall (after rust native)",
    run: async () => {
      const stage = initMsys64Stage("stage2");
      await runContext(
        "rebaseall-stage2-after-rust-native.txt",
        "Run rebaseall -p after rust native",
      ).step((step) => rebaseallMsys64Stage2(step, stage));
    },
  },
  {
    id: "stage2-cargo",
    group: 7,
    label: "stage2 cargo-c",
    run: async () => {
      const stage = initMsys64Stage("stage2");
      console.log("Build cargo-c for stage2 (single.sh cargo-c)");
      await runMsysBuild(
        "build-stage2-cargo-native.txt",
        `${msysStage2BasicExports}; ${checkBootstrap}; ${buildSingle} cargo-c`,
        stage,
      );
    },
  },
  {
    id: "stage2-lists",
    group: 8,
    label: "stage2 package lists",
    run: async () => {
      const stage = initMsys64Stage("stage2");
      console.log("Build stage2 MSYS packages (scripts/generated/stage2-list.sh)");
      await runMsysBuild(
        "build-stage2.txt",
        `${msysStage2BasicExports}; ${checkBootstrap}; sh scripts/generated/stage2-list.sh`,
        stage,
      );
    },
  },
  {
    id: "stage3-prep",
    group: 9,
    label: "stage3 prep (cygwin packages + archive)",
    run: async () => {
      initMsys64Stage("stage3");
      await runContext(
        "install-for-stage3.txt",
        "Install stage1/stage2 packages into msys64-stage3 and create archive",
      ).step(installStage3);
    },
  },
  {
    id: "stage3-mingw",
    group: 10,
    label: "stage3 extract + mingw packages",
    run: async () => {
      const stage = initMsys64Stage("stage3");
      await runContext(
        "extract-stage3.txt",
        "Extract msys64-stage3 from archive",
      ).step((step) => extractMsys64(step, stage));
      await runContext(
        "install-mingw-for-stage3.txt",
        "Install mingw-w64 packages for stage3",
      ).step(installMingwStage3);
    },
  },
];

function resolveFromStep(fromArg: string): string {
  if (/^([1-9]|10)$/.test(fromArg)) {
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
  console.log(`Usage: start.bat [--from <step>] [--only] [--help]

Run the MSYS2/Cygwin bootstrap pipeline from the beginning or from a step.

Options:
  -h, --help           Show this help and exit
  --from <step>        Start at <step> and run through the end
  --only               With --from, run only that step and exit

Environment:
  CI_TOOLS_ROOT        CI tools root (default: D:\\CI-Tools)

Pipeline groups:
  1. stage0 install MSYS packages
  2. stage0 generate deps and package lists
  3. stage0 extract archive
  4. hook/runtime builds
  5. stage1
  6. stage2 prep
  7. stage2 gcc/rust/cargo
  8. stage2 package lists
  9. stage3 prep (cygwin + archive)
  10. stage3 extract + mingw

Steps (--from accepts the id or group number 1-10):
`);
  for (const step of pipeline) {
    console.log(`  ${step.group}. ${step.id.padEnd(20)} ${step.label}`);
  }
  console.log(`
Examples:
  start.bat
  start.bat --from stage0-deps
  start.bat --from stage0-gen-build-all --only
  start.bat --from 6
  start.bat --from stage2-gcc
  start.bat --from stage2-rust-native
  start.bat --from stage3-mingw

More detail: BUILD-START.md
`);
}

function parseArgs(argv: string[]) {
  let fromStep: string | null = null;
  let onlyStep = false;

  for (let i = 0; i < argv.length; i += 1) {
    const arg = argv[i];
    if (arg === "--help" || arg === "-h") {
      printHelp();
      process.exit(0);
    }
    if (arg === "--only") {
      onlyStep = true;
      continue;
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

  return { fromStep, onlyStep };
}

async function main() {
  const { fromStep, onlyStep } = parseArgs(process.argv.slice(2));
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
      `Starting pipeline at step ${startIndex + 1}/${pipeline.length}: ${pipeline[startIndex].label} (${pipeline[startIndex].id})`,
    );
  }

  if (onlyStep && !fromStep) {
    console.error("--only requires --from");
    console.error("Run start.bat --help for usage.");
    process.exit(1);
  }

  for (let i = startIndex; i < pipeline.length; i += 1) {
    const step = pipeline[i];
    console.log("");
    console.log(`=== ${i + 1}/${pipeline.length}: ${step.label} (${step.id}) ===`);
    await step.run();
    if (onlyStep) {
      break;
    }
  }
}

main().catch((error) => {
  console.error(error);
  process.exit(1);
});
