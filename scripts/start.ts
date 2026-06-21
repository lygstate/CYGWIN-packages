import * as path from "node:path";
import {
  bootstrap_env_stage1_core,
  bootstrap_env_stage1,
  bootstrap_env_stage2,
  bootstrap_env_stage2_rust_cross,
  GENERATED_STAGE1_INSTALL_TXT,
  GENERATED_STAGE2_INSTALL_TXT,
} from "./build-config.ts";
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
import {
  runSinglePackage,
  runPackageList,
  clearInstallPackageList,
} from "./single.ts";
import { runStageHook } from "./stage-hook.ts";
import { initMsys64Stage, repoPath, type Msys64Stage } from "./utils.ts";

process.on("SIGINT", () => {
  console.log("Caught interrupt signal");
  process.exit(130);
});

const ciToolsRoot = process.env.CI_TOOLS_ROOT || "D:\\CI-Tools";
const pathOld = process.env.PATH || "";
const cmdExe = process.env.COMSPEC || "C:\\Windows\\System32\\cmd.exe";
const systemRoot = process.env.SystemRoot || "C:\\Windows";

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

const runtimePackagesInit = [
  "./dist-pkg/libiconv-devel-$LIBICONV_PKGVER-1-x86_64.pkg.tar.zst",
  "./dist-pkg/libiconv-$LIBICONV_PKGVER-1-x86_64.pkg.tar.zst",
  "./dist-pkg/libltdl-$LIBTOOL_PKGVER-$LIBTOOL_PKGREL-x86_64.pkg.tar.zst",
  "./dist-pkg/libtool-$LIBTOOL_PKGVER-$LIBTOOL_PKGREL-x86_64.pkg.tar.zst",
  "./dist-pkg/tcl-8.6.12-3-x86_64.pkg.tar.zst",
].join(" ");

const checkBootstrap = "source scripts/sh/check-bootstrap.sh";

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
  step: (step: RunContext) => Promise<void>;
};

function pipelineLogName(id: string) {
  return `${id}.txt`;
}

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

async function runMsysBuildStep(
  step: RunContext,
  command: string,
  stage: Msys64Stage,
) {
  // Piped stdio is not a TTY, so bash/make block-buffer unless we force line
  // buffering (stdbuf) so log file output arrives incrementally.
  const lineBufferedCommand = `exec stdbuf -oL -eL sh -c ${JSON.stringify(command)}`;
  await step.run(stage.bash, ["--login", "-c", lineBufferedCommand], {
    env: {
      ...stage.env,
      PYTHONUNBUFFERED: "1",
    },
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
    id: "stage0-install-prep",
    group: 1,
    label: "Install MSYS base packages into msys64-stage1",
    step: installStage0,
  },
  {
    id: "stage0-deps",
    group: 2,
    label: "Generate scripts/generated/deps.json (deps.ts)",
    step: async (step) => {
      await runDeps(step, initMsys64Stage("stage1"));
    },
  },
  {
    id: "stage0-gen-build-all",
    group: 2,
    label: "Generate stage1/stage2 package lists (gen-build-all.ts)",
    step: async () => {
      await runGenBuildAll();
    },
  },
  {
    id: "stage0-extract",
    group: 3,
    label: "Extract msys64-stage1 from archive",
    step: async (step) => {
      const stage = initMsys64Stage("stage1");
      await extractMsys64(step, stage);
    },
  },
  {
    id: "hook-runtime-install-original",
    group: 4,
    label: "Install original msys2-runtime packages",
    step: async (step) => {
      const stage = initMsys64Stage("stage1");
      await installMsys2OriginalRuntime(step, stage);
    },
  },
  {
    id: "hook-runtime-build-hook",
    group: 4,
    label: "hook runtime build (stage-hook)",
    step: async (step) => {
      const stage = initMsys64Stage("stage1");
      await runStageHook(step, stage);
    },
  },
  {
    id: "hook-runtime-install-hook",
    group: 4,
    label: "Install hook-patched msys2-runtime packages",
    step: async (step) => {
      const stage = initMsys64Stage("stage1");
      await installMsys2HookRuntime(step, stage);
    },
  },
  {
    id: "stage0-list",
    group: 4,
    label: "stage0 package list (stage0-list.txt)",
    step: async (step) => {
      const stage = initMsys64Stage("stage1", bootstrap_env_stage1_core);
      await runPackageList(
        step,
        stage,
        repoPath("scripts", "generated", "stage0-list.txt"),
      );
    },
  },
  {
    id: "stage1-init",
    group: 5,
    label: "stage1 init (stage1-init.sh)",
    step: async (step) => {
      const stage = initMsys64Stage("stage1", bootstrap_env_stage1);
      await step.run(
        stage.bash,
        ["--login", "-c", "source scripts/sh/stage1-init.sh"],
        { cwd: repoPath("."), env: stage.env },
      );
    },
  },
  {
    id: "stage1-list",
    group: 5,
    label: "stage1 package list (stage1-list.txt)",
    step: async (step) => {
      const stage = initMsys64Stage("stage1", bootstrap_env_stage1);
      await clearInstallPackageList(
        repoPath(...GENERATED_STAGE1_INSTALL_TXT.split("/")),
      );
      await runPackageList(
        step,
        stage,
        repoPath("scripts", "generated", "stage1-list.txt"),
      );
    },
  },
  {
    id: "stage2-install-prep",
    group: 6,
    label: "Install stage1-built packages into msys64-stage2",
    step: async (step) => {
      await installStage2(step);
    },
  },
  {
    id: "stage2-gcc",
    group: 7,
    label: "stage2 build gcc",
    step: async (step) => {
      const stage = initMsys64Stage("stage2", bootstrap_env_stage2);
      await runSinglePackage(step, stage, "gcc");
    },
  },
  {
    id: "stage2-rust-cross",
    group: 7,
    label: "stage2 build rust (cross)",
    step: async (step) => {
      const stage = initMsys64Stage("stage2", bootstrap_env_stage2_rust_cross);
      await runSinglePackage(step, stage, "rust");
    },
  },
  {
    id: "stage2-rebaseall",
    group: 7,
    label: "Run rebaseall -p before rust native",
    step: async (step) => {
      const stage = initMsys64Stage("stage2");
      await rebaseallMsys64Stage2(step, stage);
    },
  },
  {
    id: "stage2-rust-native",
    group: 7,
    label: "stage2 build rust (native)",
    step: async (step) => {
      const stage = initMsys64Stage("stage2", bootstrap_env_stage2);
      await runSinglePackage(step, stage, "rust");
    },
  },
  {
    id: "stage2-rebaseall-2",
    group: 7,
    label: "Run rebaseall -p after rust native",
    step: async (step) => {
      const stage = initMsys64Stage("stage2");
      await rebaseallMsys64Stage2(step, stage);
    },
  },
  {
    id: "stage2-cargo",
    group: 7,
    label: "stage2 build cargo-c",
    step: async (step) => {
      const stage = initMsys64Stage("stage2", bootstrap_env_stage2);
      await runSinglePackage(step, stage, "cargo-c");
    },
  },
  {
    id: "stage2-list",
    group: 8,
    label: "stage2 package list (stage2-list.txt)",
    step: async (step) => {
      const stage2InstallList = repoPath(
        ...GENERATED_STAGE2_INSTALL_TXT.split("/"),
      );
      await clearInstallPackageList(stage2InstallList);
      const stage = initMsys64Stage("stage2", bootstrap_env_stage2);
      await runPackageList(
        step,
        stage,
        repoPath("scripts", "generated", "stage2-list.txt"),
      );
    },
  },
  {
    id: "stage3-install-prep",
    group: 9,
    label: "Install stage1/stage2 packages into msys64-stage3 and create archive",
    step: async (step) => {
      await installStage3(step);
    },
  },
  {
    id: "stage3-extract",
    group: 10,
    label: "Extract msys64-stage3 from archive",
    step: async (step) => {
      const stage = initMsys64Stage("stage3");
      await extractMsys64(step, stage);
    },
  },
  {
    id: "stage3-mingw-install",
    group: 10,
    label: "Install mingw-w64 packages for stage3",
    step: installMingwStage3,
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

Pipeline groups ( --from <n> starts at the first step in group n ):
  1. stage0 install prep
  2. stage0 deps and package lists
  3. stage0 extract archive
  4. hook/runtime (4 steps)
  5. stage1 init and package list
  6. stage2 install prep
  7. stage2 gcc/rust/cargo/rebaseall
  8. stage2 package lists
  9. stage3 install prep
  10. stage3 extract and mingw install

Steps (--from accepts the id or group number 1-10):
`);
  for (const item of pipeline) {
    console.log(`  ${item.group}. ${item.id.padEnd(28)} ${item.label}`);
  }
  console.log(`
Examples:
  start.bat
  start.bat --from stage0-install-prep
  start.bat --from stage0-deps
  start.bat --from stage0-gen-build-all --only
  start.bat --from stage2-install-prep
  start.bat --from stage2-gcc
  start.bat --from stage1-list
  start.bat --from stage2-list
  start.bat --from stage3-extract
  start.bat --from stage3-mingw-install

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
    const item = pipeline[i];
    console.log("");
    console.log(`=== ${i + 1}/${pipeline.length}: ${item.label} (${item.id}) ===`);
    await runContext(pipelineLogName(item.id), item.label).step(item.step);
    if (onlyStep) {
      break;
    }
  }
}

main().catch((error) => {
  console.error(error);
  process.exit(1);
});
