import * as fs from "fs/promises";
import * as path from "path";
import {
  BAT_MSYS64_HOME_PATH,
  BAT_MSYS64_PACMAN_CACHE_PATH,
  DELETE_MSYS64_BAT_FILENAME,
  EXTRACT_BAT_FILENAME,
  GENERATED_MSYS_TXT,
  MSYS2_BASE_TARBALL,
  MSYS64_DIR_NAME,
  MSYS_BASH_ENV,
  PACMAN_NONINTERACTIVE_YES_LINES,
  bash_bootstrap_core_upgrade_steps,
  bash_detach_pacman_pkg_cache,
  bash_merge_pacman_pkg_to_shared,
  bat_safe_unlink_dir,
  black_list,
} from "./build-config.ts";
import {
  getYYYYMMDD,
  type RunContext,
} from "./utils.ts";

export {
  bash_bootstrap_core_upgrade,
  bash_bootstrap_core_upgrade_steps,
  bash_clear_pacman_db_lock,
  bash_detach_pacman_pkg_cache,
  bash_merge_pacman_pkg_to_shared,
  bash_unlink_pacman_pkg,
} from "./build-config.ts";

// Node spawn has no TTY; pacman still prompts on corrupted cache files and
// treats EOF as No even with --noconfirm. Pipe a bounded yes stream so delete-it
// queries get Y without exhausting Cygwin process slots.
export function wrapPacmanNonInteractiveCommand(install_command: string) {
  return `{ yes 2>/dev/null; } | head -n ${PACMAN_NONINTERACTIVE_YES_LINES} | { ${install_command}; }`;
}

export function buildExtractBatContent(msys2_base_filename) {
  return `
pushd "%~dp0"\..
set __CI_TOOLS_DIR=%CD%
popd
set _MSYS64_CACHES=%__CI_TOOLS_DIR%\\msys64-caches

pushd "%~dp0"

if not exist msys64 (
  tar xf ${msys2_base_filename}
)

call :safe_unlink_dir ${BAT_MSYS64_HOME_PATH}
mklink /D ${BAT_MSYS64_HOME_PATH} %_MSYS64_CACHES%\\${BAT_MSYS64_HOME_PATH}

call :safe_unlink_dir ${BAT_MSYS64_PACMAN_CACHE_PATH}
mklink /D ${BAT_MSYS64_PACMAN_CACHE_PATH} %_MSYS64_CACHES%\\${BAT_MSYS64_PACMAN_CACHE_PATH}

popd

if defined CI_TOOLS_DISABLE_PAUSE ( goto :eof )

pause

${bat_safe_unlink_dir}
`.trimStart();
}

export function buildDeleteMsys64BatContent() {
  return `
pushd "%~dp0"

if exist msys64-to-delete (
  call :safe_unlink_dir msys64-to-delete\\var\\cache\\pacman\\pkg
  call :safe_unlink_dir msys64-to-delete\\home
  rd /s /q msys64-to-delete
)
if exist msys64 (rename msys64 msys64-to-delete)
if exist msys64 (
  echo "Delete msys64 failed"
)
if exist msys64-to-delete (
  call :safe_unlink_dir msys64-to-delete\\var\\cache\\pacman\\pkg
  call :safe_unlink_dir msys64-to-delete\\home
  rd /s /q msys64-to-delete
)

popd

if defined CI_TOOLS_DISABLE_PAUSE ( goto :eof )
pause

:eof

${bat_safe_unlink_dir}
`.trimStart();
}

export async function writeExtractBat(
  ci_tools_msys64_parent,
  msys2_base_filename,
  bat_filename = EXTRACT_BAT_FILENAME,
) {
  const extract_bat_path = path.join(ci_tools_msys64_parent, bat_filename);
  await fs.writeFile(
    extract_bat_path,
    buildExtractBatContent(msys2_base_filename),
    "utf-8",
  );
  console.log(`===Wrote ${extract_bat_path}`);
}

export async function writeDeleteMsys64Bat(ci_tools_msys64_parent) {
  const delete_bat_path = path.join(
    ci_tools_msys64_parent,
    DELETE_MSYS64_BAT_FILENAME,
  );
  await fs.writeFile(
    delete_bat_path,
    buildDeleteMsys64BatContent(),
    "utf-8",
  );
  console.log(`===Wrote ${delete_bat_path}`);
}

// Write extract.bat and delete-msys64.bat into a stage folder (e.g. msys64-stage0).
export async function installMsys2StageBatchScripts(
  ci_tools_msys64_parent,
  msys2_base_filename,
  bat_filename = EXTRACT_BAT_FILENAME,
) {
  await writeExtractBat(
    ci_tools_msys64_parent,
    msys2_base_filename,
    bat_filename,
  );
  await writeDeleteMsys64Bat(ci_tools_msys64_parent);
}

function msysBashExe(msys_root) {
  return path.join(msys_root, "usr", "bin", "bash.exe");
}

function msysBashEnv() {
  return { ...MSYS_BASH_ENV };
}

export type ProcessRunner = Pick<RunContext, "runProcess">;

export class Msys2Installer {
  fs: any;
  baseTarball: string;

  constructor(overrides: Record<string, any> = {}) {
    this.fs = fs;
    this.baseTarball = MSYS2_BASE_TARBALL;
    Object.assign(this, overrides);
  }

  async runMsysBash(msys_root, script, step: ProcessRunner) {
    const prelude = `mkdir -p /tmp\n${script}`;
    await step.runProcess(
      msysBashExe(msys_root),
      ["--login", "-c", prelude],
      {
        env: msysBashEnv(),
        capture: false,
        tee: true,
      },
    );
  }

  async runMsysBashPacmanStep(
    msys_root,
    install_command,
    cwd,
    step: ProcessRunner,
  ) {
    const wrapped_command = wrapPacmanNonInteractiveCommand(install_command);
    console.log(`===Execute: "${install_command}" at ${msys_root} at ${cwd}`);
    const { code } = await step.runProcess(
      msysBashExe(msys_root),
      ["--login", "-c", wrapped_command],
      {
        cwd: cwd,
        env: msysBashEnv(),
        capture: false,
        tee: true,
      },
    );
    if (code !== 0) {
      throw new Error(
        `runMsysBashPacmanStep failed (${code}): ${install_command}`,
      );
    }
  }

  async bootstrapCoreUpgrade(msys_root, cwd, step: ProcessRunner) {
    console.log(`===Bootstrap core upgrade at ${msys_root}`);
    await this.linkPacmanCache(msys_root, true, step);
    for (const command of bash_bootstrap_core_upgrade_steps) {
      await this.runMsysBashPacmanStep(msys_root, command, cwd, step);
    }
    await this.linkPacmanCache(msys_root, false, step);
    console.log(`===Bootstrap core upgrade finished at ${msys_root}`);
  }

  async fsExistsAsync(p) {
    try {
      await this.fs.access(p);
      return true;
    } catch (e) {}
    return false;
  }

  // Merge tree-local pkg/ into msys64-caches. With bootstrap true, leave an empty
  // local pkg/ for the next pacman run (core self-upgrade). Otherwise symlink pkg/
  // to the shared cache so pacman reads and writes there.
  async linkPacmanCache(
    msys_root,
    bootstrap: boolean,
    step: ProcessRunner,
  ) {
    const tail = bootstrap
      ? `mkdir -p /var/cache/pacman/pkg
touch /var/cache/pacman/pkg/gitignore`
      : `ln -sfnT "$SHARED" /var/cache/pacman/pkg`;
    const script = `${bash_merge_pacman_pkg_to_shared}
${tail}`.trim();
    console.log(
      `===linkPacmanCache bootstrap=${bootstrap} at ${msys_root}`,
    );
    await this.runMsysBash(msys_root, script, step);
  }

  // Run pacman with linkPacmanCache before and after install.
  async executePacmanInstall(
    msys_root,
    install_command,
    cwd,
    bootstrap: boolean,
    step: ProcessRunner,
  ) {
    const wrapped_command = wrapPacmanNonInteractiveCommand(install_command);
    console.log(`===Execute: "${install_command}" at ${msys_root} at ${cwd}`);
    await this.linkPacmanCache(msys_root, bootstrap, step);
    const { code } = await step.runProcess(
      msysBashExe(msys_root),
      ["--login", "-c", wrapped_command],
      {
        cwd: cwd,
        env: msysBashEnv(),
        capture: false,
        tee: true,
      },
    );
    if (code !== 0) {
      throw new Error(
        `executePacmanInstall failed (${code}): ${install_command}`,
      );
    }
    await this.linkPacmanCache(msys_root, false, step);
  }

  async clearMsys64(msys_root, step: ProcessRunner) {
    console.log(`Remove existing ${msys_root}`);
    if (!(await this.fsExistsAsync(msys_root))) {
      return;
    }
    const bash_exe = msysBashExe(msys_root);
    if (await this.fsExistsAsync(bash_exe)) {
      console.log(`===Merge pacman cache before removing ${msys_root}`);
      await this.linkPacmanCache(msys_root, false, step);
      await this.runMsysBash(msys_root, bash_detach_pacman_pkg_cache, step);
    } else {
      console.log(`===Skip cache merge, bash missing at ${bash_exe}`);
    }
    try {
      await this.fs.rm(msys_root, { recursive: true, force: true });
    } catch (e) {
      console.log(`remove with error: ${e}`);
      process.exit(0);
    }
  }

  async installMsys2BasePackages(
    ci_tools_msys64_parent,
    enable_clear_msys64,
    step: ProcessRunner,
  ) {
    const msys_root = path.join(ci_tools_msys64_parent, MSYS64_DIR_NAME);
    if (enable_clear_msys64) {
      await this.clearMsys64(msys_root, step);
    }

    console.log(`===Init env at ${msys_root}`);
    let has_msys64 = await this.fsExistsAsync(msys_root);
    const has_bash =
      has_msys64 && (await this.fsExistsAsync(msysBashExe(msys_root)));
    if (has_msys64 && !has_bash) {
      console.log(`===Broken msys64 at ${msys_root}, removing before extract`);
      await this.fs.rm(msys_root, { recursive: true, force: true });
      has_msys64 = false;
    }
    if (!has_msys64) {
      console.log(`===Extracting base`);
      await step.runProcess(
        `tar`,
        [
          "xf",
          path.join(ci_tools_msys64_parent, this.baseTarball),
        ],
        {
          cwd: ci_tools_msys64_parent,
          capture: false,
          tee: true,
        },
      );
      console.log("===Extract base finished\n");
    }

    await this.bootstrapCoreUpgrade(msys_root, msys_root, step);

    await this.executePacmanInstall(
      msys_root,
      `pacman -Syu --noconfirm`,
      msys_root,
      false,
      step,
    );
    console.log("===Full pacman -Syu finished");
    return has_msys64;
  }

  async installMsys2AllPackages(
    ci_tools_msys64_parent,
    pkg_root,
    enable_clear_msys64,
    step: ProcessRunner,
  ) {
    const msys_root = path.join(ci_tools_msys64_parent, MSYS64_DIR_NAME);
    const has_msys64 = await this.installMsys2BasePackages(
      ci_tools_msys64_parent,
      enable_clear_msys64,
      step,
    );
    const pkg_root_cygwin = (
      await step.runProcess(
        path.join(msys_root, "usr", "bin", "cygpath.exe"),
        [pkg_root],
      )
    ).stdout.trim();

    const msys_list_capture = await step.runProcess(
      path.join(msys_root, "usr", "bin", "pacman.exe"),
      ["-Sl", "msys"],
    );
    const msys_list_content = msys_list_capture.stdout.trim();
    const packages = [];

    for (let pkg of msys_list_content.split("\n")) {
      const pkg_name = pkg.trim().split(/\s+/)[1];
      if (!pkg_name) continue;
      if (black_list.has(pkg_name)) continue;
      packages.push(pkg_name);
    }
    const msys_txt_path = path.join(pkg_root, GENERATED_MSYS_TXT);
    await this.fs.mkdir(path.dirname(msys_txt_path), { recursive: true });
    await this.fs.writeFile(msys_txt_path, packages.join("\n"), "utf-8");

    console.log(`===Installing all packages`);

    const bash_commands_for_install_all = [
      `sed -i 's/^SigLevel.*$/SigLevel=Never/g' /etc/pacman.conf`,
      `cat /etc/pacman.conf | grep ^SigLevel`,
      `pacman -S --noconfirm --needed $(cat ${GENERATED_MSYS_TXT})`,
    ];

    await this.executePacmanInstall(
      msys_root,
      `cd ${pkg_root_cygwin}/; ${bash_commands_for_install_all.join("; ")}`,
      pkg_root,
      false,
      step,
    );

    console.log(
      `===Installing all packages finished at ${ci_tools_msys64_parent}`,
    );

    return has_msys64;
  }

  async archiveFull(
    ci_tools_msys64_parent,
    msys_root,
    msys2_base_filename,
    step: ProcessRunner,
  ) {
    const ci_tools_msys64_parent_cygwin = (
      await step.runProcess(
        path.join(msys_root, "usr", "bin", "cygpath.exe"),
        [ci_tools_msys64_parent],
      )
    ).stdout.trim();
    if (!msys2_base_filename) {
      msys2_base_filename = `msys2-base-x86_64-${getYYYYMMDD(new Date())}-full.tar`;
    }
    let target_msys_tar_path = path.join(
      ci_tools_msys64_parent,
      msys2_base_filename,
    );
    let target_msys_tar_path_cygwin = `${ci_tools_msys64_parent_cygwin}/${msys2_base_filename}`;
    console.log(`===Compress msys64 into ${target_msys_tar_path}`);
    try {
      await this.fs.rm(target_msys_tar_path, { force: true, recursive: true });
    } catch (e) {
      console.log(`remove ${target_msys_tar_path} failed with: ${e}`);
    }

    await step.runProcess(
      msysBashExe(msys_root),
      [
        "--login",
        "-c",
        [
          `rm -f ${target_msys_tar_path_cygwin}`,
          bash_detach_pacman_pkg_cache,
          `mkdir -p /var/cache/pacman/pkg`,
          `touch /var/cache/pacman/pkg/gitignore`,
        ].join("; "),
      ],
      {
        env: msysBashEnv(),
        capture: false,
        tee: true,
      },
    );
    await step.runProcess(
      path.join(msys_root, "usr", "bin", "tar.exe"),
      ["cf", target_msys_tar_path_cygwin, MSYS64_DIR_NAME],
      {
        cwd: ci_tools_msys64_parent,
        env: msysBashEnv(),
        capture: false,
        tee: true,
      },
    );

    await this.linkPacmanCache(msys_root, false, step);
    return msys2_base_filename;
  }
}

const defaultMsys2Installer = new Msys2Installer();

export async function removeDirectory(folder_dir) {
  console.log(`Remove existing ${folder_dir}`);
  try {
    await fs.rm(folder_dir, { recursive: true, force: true });
  } catch (e) {
    console.log(`remove with error: ${e}`);
    process.exit(0);
  }
  let has_folder = await defaultMsys2Installer.fsExistsAsync(folder_dir);
  console.log(
    `Remove ${folder_dir} finished with: ${has_folder ? "exists" : "not exists"}`,
  );
}

export async function linkPacmanCache(
  msys_root,
  bootstrap: boolean,
  step: ProcessRunner,
) {
  return defaultMsys2Installer.linkPacmanCache(
    msys_root,
    bootstrap,
    step,
  );
}

export async function archiveFull(
  ci_tools_msys64_parent,
  msys_root,
  msys2_base_filename = "",
  step: ProcessRunner,
) {
  return defaultMsys2Installer.archiveFull(
    ci_tools_msys64_parent,
    msys_root,
    msys2_base_filename,
    step,
  );
}

export async function executePacmanInstall(
  msys_root,
  install_command,
  cwd,
  bootstrap: boolean,
  step: ProcessRunner,
) {
  return defaultMsys2Installer.executePacmanInstall(
    msys_root,
    install_command,
    cwd,
    bootstrap,
    step,
  );
}

export async function fsExistsAsync(p) {
  return defaultMsys2Installer.fsExistsAsync(p);
}

export async function installMsys2BasePackages(
  ci_tools_msys64_parent,
  enable_clear_msys64,
  step: ProcessRunner,
) {
  return defaultMsys2Installer.installMsys2BasePackages(
    ci_tools_msys64_parent,
    enable_clear_msys64,
    step,
  );
}

export async function installMsys2AllPackages(
  ci_tools_msys64_parent,
  pkg_root,
  enable_clear_msys64,
  step: ProcessRunner,
) {
  return defaultMsys2Installer.installMsys2AllPackages(
    ci_tools_msys64_parent,
    pkg_root,
    enable_clear_msys64,
    step,
  );
}

export async function installMsys2ExtractScript(
  ci_tools_msys64_parent,
  msys2_base_filename,
  bat_filename,
) {
  await installMsys2StageBatchScripts(
    ci_tools_msys64_parent,
    msys2_base_filename,
    bat_filename || EXTRACT_BAT_FILENAME,
  );
}

export async function installMsys2DeleteScript(ci_tools_msys64_parent) {
  await writeDeleteMsys64Bat(ci_tools_msys64_parent);
}
