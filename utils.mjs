import { spawn } from "child_process";
import * as fs from "fs/promises";
import * as path from "path";

export const black_list = new Set([
  // "ca-certificates",
  "cmake-bootstrap", // cmake-emacs-4.2.1-1 and cmake-bootstrap-4.2.1-1 are in conflict.
  "mingw-w64-cross-clang", // mingw-w64-cross-clang: /opt/i686-w64-mingw32/bin/ar exists in filesystem
  "mingw-w64-cross-clang-crt",
  "mingw-w64-cross-clang-headers",
  "msys2-runtime-3.3",
  "msys2-runtime-3.3-devel",
  "msys2-runtime-3.4",
  "msys2-runtime-3.4-devel",
  "msys2-runtime-3.5",
  "msys2-runtime-3.5-devel",
  "parallel", // parallel: /usr/bin/parallel exists in filesystem /usr/bin/parallel.exe is owned by moreutils 0.70-1
  "gnu-netcat", // gnu-netcat-0.7.1-3 and openbsd-netcat-1.234_1-1 are in conflict. Remove openbsd-netcat? [Y/n] "
  // uutils cp -a breaks Cygwin bootstrap (xattr spam, EEXIST on dir merge).
  // Use GNU coreutils during stage0; uutils-coreutils is built at stage2.
  "uutils-coreutils",
]);

export const ci_tools_base = process.env.CI_TOOLS_ROOT || "D:/CI-Tools";

export const ci_tools_msys64_stage0 = `${ci_tools_base}/msys64-stage0`;
export const ci_tools_msys64_stage2 = `${ci_tools_base}/msys64-stage2`;
export const ci_tools_msys64_stage3 = `${ci_tools_base}/msys64-stage3`;

// Remove /var/cache/pacman/pkg without following a symlink into msys64-caches.
export const bash_unlink_pacman_pkg = `
PKG=/var/cache/pacman/pkg
if [ -L "$PKG" ] || [ -h "$PKG" ]; then
  unlink "$PKG"
elif [ -n "$(readlink "$PKG" 2>/dev/null)" ]; then
  unlink "$PKG"
elif [ -d "$PKG" ]; then
  rm -rf "$PKG"
elif [ -e "$PKG" ]; then
  rm -f "$PKG"
fi
`.trim();

export const bash_detach_pacman_pkg_cache = bash_unlink_pacman_pkg;

export const msys64_pacman_pkg_cache_subdir =
  "msys64-caches/msys64/var/cache/pacman/pkg";

// rmdir first so junction/symlink targets under msys64-caches are not wiped.
export const bat_safe_unlink_dir = `
:safe_unlink_dir
if not exist "%~1" exit /B 0
rmdir "%~1" 2>nul
if exist "%~1" rd /s /q "%~1"
exit /B 0
`.trim();

export function buildExtractBatContent(msys2_base_filename) {
  const pacman_cache_path = "msys64\\var\\cache\\pacman\\pkg";
  const msys64_home = "msys64\\home";
  return `
pushd "%~dp0"\..
set __CI_TOOLS_DIR=%CD%
popd
set _MSYS64_CACHES=%__CI_TOOLS_DIR%\\msys64-caches

pushd "%~dp0"

if not exist msys64 (
  tar xf ${msys2_base_filename}
)

call :safe_unlink_dir ${msys64_home}
mklink /D ${msys64_home} %_MSYS64_CACHES%\\${msys64_home}

call :safe_unlink_dir ${pacman_cache_path}
mklink /D ${pacman_cache_path} %_MSYS64_CACHES%\\${pacman_cache_path}

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
  bat_filename = "extract.bat",
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
    "delete-msys64.bat",
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
  bat_filename = "extract.bat",
) {
  await writeExtractBat(
    ci_tools_msys64_parent,
    msys2_base_filename,
    bat_filename,
  );
  await writeDeleteMsys64Bat(ci_tools_msys64_parent);
}

// Copy tree-local .pkg.tar.* into msys64-caches (never deletes SHARED).
export const bash_merge_pacman_pkg_to_shared = `
export CI_TOOLS_DIR_WIN=\`cygpath -w /\`/../..
export CI_TOOLS_DIR_POSIX=\`cygpath -p $CI_TOOLS_DIR_WIN\`
SHARED=$CI_TOOLS_DIR_POSIX/${msys64_pacman_pkg_cache_subdir}
PKG=/var/cache/pacman/pkg
echo CI_TOOLS_DIR_POSIX:$CI_TOOLS_DIR_POSIX SHARED:$SHARED
rm -rf /var/lib/pacman/db.lck
mkdir -p "$SHARED"
if [ -d "$PKG" ] && [ -z "$(readlink "$PKG" 2>/dev/null)" ]; then
  cp -af "$PKG"/* "$SHARED/" 2>/dev/null || true
fi
${bash_unlink_pacman_pkg}
`.trim();

// MSYS2 has no pacman "core" group. Upgrade pacman alone first; self-upgrade
// in one -S transaction breaks the info post-transaction hook (db.lck / fork).
export const bash_bootstrap_core_upgrade = [
  `echo "Init msys with $MSYSTEM finished"`,
  `rm -rf /var/lib/pacman/db.lck`,
  `pacman -Sy --noconfirm`,
  `pacman -S --noconfirm --needed pacman`,
  `rm -rf /var/lib/pacman/db.lck`,
  `pacman -S --noconfirm --needed bash filesystem mintty msys2-runtime pacman-mirrors`,
  `rm -rf /var/lib/pacman/db.lck`,
].join("; ");

export function spawnProcessAsyncCapture(command, args = [], options = {}) {
  return new Promise((resolve, reject) => {
    // Collect stdout and stderr data
    let stdoutOutput = "";
    let stderrOutput = "";

    const child = spawn(command, args, options);

    // Capture stdout data chunks
    child.stdout.on("data", (data) => {
      stdoutOutput += data.toString();
    });

    // Capture stderr data chunks
    child.stderr.on("data", (data) => {
      stderrOutput += data.toString();
    });

    // Handle process errors (e.g., command not found)
    child.on("error", (err) => {
      reject(err);
    });

    // Handle process exit
    child.on("close", (code) => {
      if (code !== 0) {
        // Reject the promise if the process fails (non-zero exit code)
        reject(new Error(`Process exited with code ${code}: ${stderrOutput}`));
      } else {
        // Resolve the promise with the captured output
        resolve({ stdout: stdoutOutput, stderr: stderrOutput, code });
      }
    });
  });
}

function msysBashExe(msys_root) {
  return path.join(msys_root, "usr", "bin", "bash.exe");
}

function msysBashEnv() {
  return {
    MSYS: "winsymlinks:native",
    MSYSTEM: "MSYS",
    CHERE_INVOKING: "1",
  };
}

export class Msys2Installer {
  constructor(overrides = {}) {
    this.spawnProcessAsync = spawnProcessAsync;
    this.spawnProcessAsyncCapture = spawnProcessAsyncCapture;
    this.fs = fs;
    this.baseTarball = "msys2-base-x86_64-20251213.tar.zst";
    Object.assign(this, overrides);
  }

  async runMsysBash(msys_root, script) {
    await this.spawnProcessAsync(
      msysBashExe(msys_root),
      ["--login", "-c", script],
      { env: msysBashEnv() },
    );
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
  async linkPacmanCache(msys_root, bootstrap = false) {
    const tail = bootstrap
      ? `mkdir -p /var/cache/pacman/pkg
touch /var/cache/pacman/pkg/gitignore`
      : `ln -sfnT "$SHARED" /var/cache/pacman/pkg`;
    const script = `${bash_merge_pacman_pkg_to_shared}
${tail}`.trim();
    console.log(
      `===linkPacmanCache bootstrap=${bootstrap} at ${msys_root}`,
    );
    await this.runMsysBash(msys_root, script);
  }

  // Run pacman with linkPacmanCache before and after install.
  async executePacmanInstall(
    msys_root,
    install_command,
    cwd,
    bootstrap = false,
  ) {
    console.log(`===Execute: "${install_command}" at ${msys_root} at ${cwd}`);
    await this.linkPacmanCache(msys_root, bootstrap);
    await this.spawnProcessAsync(
      msysBashExe(msys_root),
      ["--login", "-c", install_command],
      {
        cwd: cwd,
        env: msysBashEnv(),
      },
    );
    await this.linkPacmanCache(msys_root);
  }

  async clearMsys64(msys_root) {
    console.log(`Remove existing ${msys_root}`);
    if (!(await this.fsExistsAsync(msys_root))) {
      return;
    }
    const bash_exe = msysBashExe(msys_root);
    if (await this.fsExistsAsync(bash_exe)) {
      console.log(`===Merge pacman cache before removing ${msys_root}`);
      await this.linkPacmanCache(msys_root);
      await this.runMsysBash(msys_root, bash_detach_pacman_pkg_cache);
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
  ) {
    const msys_root = path.join(ci_tools_msys64_parent, "msys64");
    if (enable_clear_msys64) {
      await this.clearMsys64(msys_root);
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
      await this.spawnProcessAsync(
        `tar`,
        [
          "xf",
          path.join(ci_tools_msys64_parent, this.baseTarball),
        ],
        {
          cwd: ci_tools_msys64_parent,
        },
      );
      console.log("===Extract base finished\n");
    }

    console.log(`===Bootstrap core upgrade at ${msys_root}`);
    await this.executePacmanInstall(
      msys_root,
      bash_bootstrap_core_upgrade,
      msys_root,
      true,
    );

    console.log(`===Bootstrap core upgrade finished at ${msys_root}`);
    await this.executePacmanInstall(
      msys_root,
      `pacman -Syu --noconfirm`,
      msys_root,
    );
    console.log("===Full pacman -Syu finished");
    return has_msys64;
  }

  async installMsys2AllPackages(
    ci_tools_msys64_parent,
    pkg_root,
    enable_clear_msys64,
  ) {
    const msys_root = path.join(ci_tools_msys64_parent, "msys64");
    const has_msys64 = await this.installMsys2BasePackages(
      ci_tools_msys64_parent,
      enable_clear_msys64,
    );
    const pkg_root_cygwin = (
      await this.spawnProcessAsyncCapture(
        path.join(msys_root, "usr", "bin", "cygpath.exe"),
        [pkg_root],
      )
    ).stdout.trim();

    const msys_list_capture = await this.spawnProcessAsyncCapture(
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
    const msys_txt_path = path.join(pkg_root, "msys.txt");
    await this.fs.writeFile(msys_txt_path, packages.join("\n"), "utf-8");

    console.log(`===Installing all packages`);

    const bash_commands_for_install_all = [
      `sed -i 's/^SigLevel.*$/SigLevel=Never/g' /etc/pacman.conf`,
      `cat /etc/pacman.conf | grep ^SigLevel`,
      `pacman -S --noconfirm --needed $(cat msys.txt)`,
    ];

    await this.executePacmanInstall(
      msys_root,
      `cd ${pkg_root_cygwin}/; ${bash_commands_for_install_all.join("; ")}`,
      pkg_root,
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
  ) {
    const ci_tools_msys64_parent_cygwin = (
      await this.spawnProcessAsyncCapture(
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

    await this.spawnProcessAsync(
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
      { env: msysBashEnv() },
    );
    await this.spawnProcessAsync(
      path.join(msys_root, "usr", "bin", "tar.exe"),
      ["cf", target_msys_tar_path_cygwin, "msys64"],
      {
        cwd: ci_tools_msys64_parent,
        env: msysBashEnv(),
      },
    );

    await this.linkPacmanCache(msys_root);
    return msys2_base_filename;
  }
}

export function spawnProcessAsync(command, args = [], options = {}) {
  return new Promise((resolve, reject) => {
    const p = spawn(command, args, options);
    p.stdout?.pipe(process.stdout);
    p.stderr?.pipe(process.stderr);
    p.on("error", reject);
    p.on("exit", (code) => {
      resolve(code);
    });
  });
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

export function getYYYYMMDD(date) {
  const year = date.getFullYear();
  let month = (date.getMonth() + 1).toString(); // getMonth() is zero-based
  let day = date.getDate().toString();

  // Pad month and day with a leading zero if single digit
  if (month.length < 2) month = "0" + month;
  if (day.length < 2) day = "0" + day;

  return year + month + day;
}

export async function linkPacmanCache(msys_root, bootstrap = false) {
  return defaultMsys2Installer.linkPacmanCache(msys_root, bootstrap);
}

export async function archiveFull(
  ci_tools_msys64_parent,
  msys_root,
  msys2_base_filename,
) {
  return defaultMsys2Installer.archiveFull(
    ci_tools_msys64_parent,
    msys_root,
    msys2_base_filename,
  );
}

export async function executePacmanInstall(
  msys_root,
  install_command,
  cwd,
  bootstrap = false,
) {
  return defaultMsys2Installer.executePacmanInstall(
    msys_root,
    install_command,
    cwd,
    bootstrap,
  );
}

export async function fsExistsAsync(p) {
  return defaultMsys2Installer.fsExistsAsync(p);
}

export async function installMsys2BasePackages(
  ci_tools_msys64_parent,
  enable_clear_msys64,
) {
  return defaultMsys2Installer.installMsys2BasePackages(
    ci_tools_msys64_parent,
    enable_clear_msys64,
  );
}

export async function installMsys2AllPackages(
  ci_tools_msys64_parent,
  pkg_root,
  enable_clear_msys64,
) {
  return defaultMsys2Installer.installMsys2AllPackages(
    ci_tools_msys64_parent,
    pkg_root,
    enable_clear_msys64,
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
    bat_filename || "extract.bat",
  );
}

export async function installMsys2DeleteScript(ci_tools_msys64_parent) {
  await writeDeleteMsys64Bat(ci_tools_msys64_parent);
}
