export const DEFAULT_CI_TOOLS_ROOT = "D:/CI-Tools";

export const ci_tools_base = process.env.CI_TOOLS_ROOT || DEFAULT_CI_TOOLS_ROOT;

export const ci_tools_msys64_stage1 = `${ci_tools_base}/msys64-stage1`;
export const ci_tools_msys64_stage2 = `${ci_tools_base}/msys64-stage2`;
export const ci_tools_msys64_stage3 = `${ci_tools_base}/msys64-stage3`;

export const MSYS2_BASE_TARBALL = "msys2-base-x86_64-20251213.tar.zst";

export const MSYS64_DIR_NAME = "msys64";

export const msys64_pacman_pkg_cache_subdir =
  "msys64-caches/msys64/var/cache/pacman/pkg";

export const PACMAN_NONINTERACTIVE_YES_LINES = 64;

export const MSYS_BASH_ENV = {
  MSYS: "winsymlinks:native",
  MSYSTEM: "MSYS",
  CHERE_INVOKING: "1",
};

export const PKG_ARCHIVE_SUFFIX = ".pkg.tar.zst";

export const PKG_ARCHES = ["any", "x86_64", "i686"] as const;

export const GENERATED_MSYS_TXT = "scripts/generated/msys.txt";

export const GENERATED_STAGE1_CORE_TXT =
  "scripts/generated/stage1-core.txt";

export const GENERATED_STAGE1_RT_ORIGIN_TXT =
  "scripts/generated/stage1-rt-origin.txt";

export const GENERATED_STAGE1_RT_HOOK_TXT =
  "scripts/generated/stage1-rt-hook.txt";

export const GENERATED_STAGE1_LIST_TXT = "scripts/generated/stage1-list.txt";

export const GENERATED_STAGE2_LIST_TXT = "scripts/generated/stage2-list.txt";

export const GENERATED_STAGE1_INSTALL_TXT =
  "scripts/generated/stage1-install.txt";

export const GENERATED_STAGE2_INSTALL_TXT =
  "scripts/generated/stage2-install.txt";

export const GENERATED_MINGW_STAGE3_PACKAGES_TXT =
  "scripts/generated/install-mingw-for-stage3-packages.txt";

export const bootstrap_env_stage1_rt_origin = {
  MSYS_BUILD_PKGSUMS: "disabled",
  MSYS_BOOTSTRAP_STAGE: "",
};

export const bootstrap_env_stage1_rt_hook = {
  MSYS_BUILD_PKGSUMS: "disabled",
  MSYS_BOOTSTRAP_STAGE: "stage1_rt_hook",
};

export const bootstrap_env_stage1_core = {
  MSYS_BOOTSTRAP_STAGE: "stage1_core",
};

export const bootstrap_env_stage1 = {
  MSYS_BOOTSTRAP_STAGE: "stage1",
  MSYS_BOOTSTRAP_EXIT_ON_ERROR: "enabled",
};

export const bootstrap_env_stage2 = {
  MSYS_BOOTSTRAP_STAGE: "stage2",
};

export const bootstrap_env_stage2_rust_cross = {
  MSYS_BOOTSTRAP_STAGE: "stage2",
  MSYS_BOOTSTRAP_RUST: "enabled",
  MSYS_BOOTSTRAP_DISABLE_COPY_PACKAGES: "enabled",
  MSYS_BOOTSTRAP_PACKAGE_NAME_SUFFIX: "cross",
};

/** Skip upstream pacman -S / pactree in deps.ts and msys2-installer.ts. */
export const packages_skip_build = new Set([
  "msys2-runtime-3.3",
  "msys2-runtime-3.3-devel",
  "msys2-runtime-3.4",
  "msys2-runtime-3.4-devel",
  "msys2-runtime-3.5",
  "msys2-runtime-3.5-devel",
]);

/** Build from ports only: skip stage1 prep bulk pacman -S / pactree; single.ts skips pacman -U. */
export const packages_build_only = new Set([
  // "ca-certificates",
  "cmake-bootstrap", // cmake-emacs-4.2.1-1 and cmake-bootstrap-4.2.1-1 are in conflict.
  "mingw-w64-cross-clang", // mingw-w64-cross-clang: /opt/i686-w64-mingw32/bin/ar exists in filesystem
  "mingw-w64-cross-clang-crt",
  "mingw-w64-cross-clang-headers",
  "parallel", // parallel: /usr/bin/parallel exists in filesystem /usr/bin/parallel.exe is owned by moreutils 0.70-1
  "gnu-netcat", // gnu-netcat-0.7.1-3 and openbsd-netcat-1.234_1-1 are in conflict. Remove openbsd-netcat? [Y/n] "
  // uutils cp -a breaks Cygwin bootstrap (xattr spam, EEXIST on dir merge).
  // Use GNU coreutils during stage1 prep; uutils-coreutils is built at stage2.
  "uutils-coreutils",
]);

export function skipUpstreamPacman(pkg: string) {
  return packages_skip_build.has(pkg) || packages_build_only.has(pkg);
}

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

export const bash_clear_pacman_db_lock = `rm -rf /var/lib/pacman/db.lck`;

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
// Each step runs in its own bash process so db.lck and hooks do not overlap.
export const bash_bootstrap_core_upgrade_steps = [
  `echo "Init msys with $MSYSTEM finished"`,
  `${bash_clear_pacman_db_lock}; pacman -Sy --noconfirm`,
  `${bash_clear_pacman_db_lock}; pacman -S --noconfirm --needed pacman`,
  `${bash_clear_pacman_db_lock}; pacman -S --noconfirm --needed bash filesystem mintty msys2-runtime pacman-mirrors`,
  bash_clear_pacman_db_lock,
];

export const bash_bootstrap_core_upgrade =
  bash_bootstrap_core_upgrade_steps.join("; ");

// rmdir first so junction/symlink targets under msys64-caches are not wiped.
export const bat_safe_unlink_dir = `
:safe_unlink_dir
if not exist "%~1" exit /B 0
rmdir "%~1" 2>nul
if exist "%~1" rd /s /q "%~1"
exit /B 0
`.trim();

export const BAT_MSYS64_PACMAN_CACHE_PATH = "msys64\\var\\cache\\pacman\\pkg";

export const BAT_MSYS64_HOME_PATH = "msys64\\home";

export const EXTRACT_BAT_FILENAME = "extract.bat";

export const DELETE_MSYS64_BAT_FILENAME = "delete-msys64.bat";

export const EXTRACT_MINGW_BAT_FILENAME = "extract-mingw.bat";
