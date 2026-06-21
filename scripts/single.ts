import * as fs from "fs/promises";
import {
  PKG_ARCHIVE_SUFFIX,
  packages_build_only,
} from "./build-config.ts";
import {
  type RunContext,
} from "./run-context.ts";
import {
  parsePkgArchiveFilename,
  repoPath,
  repoRoot,
  type Msys64Stage,
} from "./utils.ts";

// packages_build_only: build from ports at stage2, but do not pacman -U into the
// live msys64 during single.sh or later install prep. Needed when installing would
// replace coreutils (e.g. uutils-coreutils) and break long-lived shells (fork).
// single.sh skips stage1/stage2 install and install-list recording when
// MSYS_SINGLE_SKIP_PACMAN_INSTALL=1 at the install-packages gate.
export function shouldInstallToMsys(packageDir: string) {
  return !packages_build_only.has(packageDir);
}

export function distPkgFileIsBuildOnly(filename: string) {
  const parsed = parsePkgArchiveFilename(filename);
  if (parsed && packages_build_only.has(parsed.pkgname)) {
    return true;
  }
  for (const name of packages_build_only) {
    if (filename.startsWith(`${name}-`)) {
      return true;
    }
  }
  return false;
}

async function assertInstallListOrEmptyDist(listPath: string, distDir: string) {
  let files: string[];
  try {
    files = await readPackageList(listPath);
  } catch {
    files = [];
  }
  const installable = files.filter((name) => !distPkgFileIsBuildOnly(name));
  if (installable.length > 0) {
    return;
  }
  let distNames: string[];
  try {
    distNames = await fs.readdir(distDir);
  } catch {
    return;
  }
  const distInstallable = distNames.filter(
    (name) =>
      name.endsWith(PKG_ARCHIVE_SUFFIX) && !distPkgFileIsBuildOnly(name),
  );
  if (distInstallable.length > 0) {
    throw new Error(
      `Install list ${listPath} has no installable packages but ${distDir} has ${distInstallable.length}; run the build step that records this list first`,
    );
  }
}

export async function clearInstallPackageList(listPath: string) {
  await fs.mkdir(repoPath("scripts", "generated"), { recursive: true });
  await fs.writeFile(listPath, "");
}

export async function pacmanUInstallListedCommand(
  listPath: string,
  distDir?: string,
) {
  if (distDir) {
    await assertInstallListOrEmptyDist(listPath, distDir);
  }
  let files: string[];
  try {
    files = await readPackageList(listPath);
  } catch {
    files = [];
  }
  const installable = files.filter((name) => !distPkgFileIsBuildOnly(name));
  const excluded = files.filter((name) => distPkgFileIsBuildOnly(name));
  if (excluded.length > 0) {
    console.log(
      `===Skipping ${excluded.length} build-only package(s) in ${listPath}: ${excluded.join(" ")}`,
    );
  }
  if (installable.length === 0) {
    return "true";
  }
  console.log(
    `===Install ${installable.length} package(s) from ${listPath}`,
  );
  return `pacman -U --noconfirm --overwrite \\* ${installable.join(" ")}`;
}

export async function readPackageList(listPath: string) {
  const content = await fs.readFile(listPath, "utf-8");
  return content
    .trim()
    .split("\n")
    .map((line) => line.trim())
    .filter((line) => line.length > 0 && !line.startsWith("#"));
}

function singleShellCommand(packageDir: string) {
  return [
    `export pkg_root_dir=${JSON.stringify(repoRoot.replace(/\\/g, "/"))}`,
    `new_dir=${JSON.stringify(packageDir)}`,
    "source scripts/sh/check-bootstrap.sh",
    "source scripts/sh/single.sh",
  ].join("\n");
}

export async function runSinglePackage(
  step: RunContext,
  stage: Msys64Stage,
  packageDir: string,
  env: NodeJS.ProcessEnv = stage.env,
) {
  const skipPacmanInstall = shouldInstallToMsys(packageDir) ? "0" : "1";
  if (shouldInstallToMsys(packageDir)) {
    console.log(`Build and install ${packageDir}`);
  } else {
    console.log(`Build-only ${packageDir} (skip pacman -U into msys64)`);
  }
  // TODO: restore line-buffered log output (stdbuf -oL -eL sh -c ...) for piped
  // bash builds; old runMsysBuildStep in start.ts did this before the TS refactor.
  // Apply in runSinglePackage for piped bash builds.
  const { code } = await step.run(
    stage.bash,
    ["--login", "-c", singleShellCommand(packageDir)],
    {
      cwd: repoRoot,
      env: {
        ...env,
        MSYS_SINGLE_SKIP_PACMAN_INSTALL: skipPacmanInstall,
      },
    },
  );
  if (code !== 0) {
    throw new Error(`single ${packageDir} failed with code ${code}`);
  }
}

export async function runPackageList(
  step: RunContext,
  stage: Msys64Stage,
  listPath: string,
  env: NodeJS.ProcessEnv = stage.env,
) {
  const packages = await readPackageList(listPath);
  console.log(`Package list ${listPath}: ${packages.length} item(s)`);
  for (const packageDir of packages) {
    await runSinglePackage(step, stage, packageDir, env);
  }
}
