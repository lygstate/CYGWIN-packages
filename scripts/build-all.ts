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
const cmdExe = process.env.COMSPEC || "C:\\Windows\\System32\\cmd.exe";

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
      `source build-check-bootstrap.sh; pacman -U --noconfirm --overwrite \\* ${packages}`,
      env,
    ),
  );
  exitWith(
    await runMsysCommand(
      msysBash,
      `source build-check-bootstrap.sh; pacman -U --noconfirm --overwrite \\* ${runtimePackagesInit}`,
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
      `source build-check-bootstrap.sh; pacman -U --noconfirm --overwrite \\* ${packages}`,
      env,
    ),
  );
  exitWith(
    await runMsysCommand(
      msysBash,
      `source build-check-bootstrap.sh; pacman -U --noconfirm --overwrite \\* ${runtimePackagesInit}`,
      env,
    ),
  );
}

async function rebaseallMsys64Stage2() {
  console.log("stage2: Do rebaseall -p for rust native");
  const rebaseEnv = { ...env, MSYS: "", MSYSTEM: "", CHERE_INVOKING: "" };
  exitWith(await runCommand(msysDash, ["/usr/bin/rebaseall", "-p"], { env: rebaseEnv }));
  exitWith(await runMsysCommand(msysBash, "rm -rf /etc/rebase.db.x86_64", env));
}

async function main() {
  console.log(`CI_TOOLS_ROOT is: ${ciToolsRoot}`);
  console.log("Preparing msys64 for stage0 by install all packages msys repo");
  await runNodeInstall("install-for-stage0.ts", "install-for-stage0.txt");

  initMsys64Stage("stage0");
  await extractMsys64();

  console.log("Building original and hook patched msys2-runtime");
  await installMsys2OriginalRuntime();
  exitWith(
    await runMsysCommandToLog(
      msysBash,
      "source build-stage-hook.sh",
      "build-stage-hook.txt",
      env,
    ),
  );

  initMsys64Stage("stage0");
  await installMsys2HookRuntime();
  exitWith(
    await runMsysCommandToLog(
      msysBash,
      "source build-stage0.sh",
      "build-stage0.txt",
      env,
    ),
  );

  exitWith(
    await runMsysCommandToLog(
      msysBash,
      "source build-stage1.sh",
      "build-stage1.txt",
      env,
    ),
  );

  initMsys64Stage("stage2");
  console.log("Preparing msys64 for stage2 by install packages built by stage1");
  await runNodeInstall("install-for-stage2.ts", "install-for-stage2.txt");

  console.log("Building gcc bootstrap for stage2");
  exitWith(
    await runMsysCommand(
      msysBash,
      `${msysStage2BasicExports}; source build-check-bootstrap.sh; sh build-single.sh gcc >build-stage2-gcc.txt 2>&1`,
      env,
    ),
  );

  console.log("Building rust cross for stage2");
  const rustCrossEnvs =
    `export MSYS_BOOTSTRAP_RUST=enabled; export MSYS_BOOTSTRAP_DISABLE_COPY_PACKAGES=enabled; export MSYS_BOOTSTRAP_PACKAGE_NAME_SUFFIX=cross; ${msysStage2BasicExports}`;
  exitWith(
    await runMsysCommand(
      msysBash,
      `${rustCrossEnvs}; source build-check-bootstrap.sh; sh build-single.sh rust >build-stage2-rust-cross.txt 2>&1`,
      env,
    ),
  );

  await rebaseallMsys64Stage2();
  console.log("Building rust native before rebaseall list for stage2");
  exitWith(
    await runMsysCommand(
      msysBash,
      `${msysStage2BasicExports}; source build-check-bootstrap.sh; sh build-single.sh rust >build-stage2-rust-native.txt 2>&1`,
      env,
    ),
  );
  await rebaseallMsys64Stage2();

  console.log("Building the cargo by native");
  exitWith(
    await runMsysCommand(
      msysBash,
      `${msysStage2BasicExports}; source build-check-bootstrap.sh; sh build-single.sh cargo-c >build-stage2-cargo-native.txt 2>&1`,
      env,
    ),
  );

  console.log("Building the rest packages");
  exitWith(
    await runMsysCommandToLog(
      msysBash,
      `${msysStage2BasicExports}; source build-check-bootstrap.sh; sh build-stage2-list.sh`,
      "build-stage2.txt",
      env,
    ),
  );
  exitWith(
    await runMsysCommandToLog(
      msysBash,
      `${msysStage2BasicExports}; source build-check-bootstrap.sh; sh build-stage2-list-extra.sh`,
      "build-stage2-list-extra.txt",
      env,
    ),
  );

  console.log("Preparing msys64 for stage3 by install packages built by stage1 and stage2");
  initMsys64Stage("stage3");
  await runNodeInstall("install-for-stage3.ts", "install-for-stage3.txt");
  await extractMsys64();
  await runNodeInstall(
    "install-mingw-for-stage3.ts",
    "install-mingw-for-stage3.txt",
  );
}

main().catch((error) => {
  console.error(error);
  process.exit(1);
});
