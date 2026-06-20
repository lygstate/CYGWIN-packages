import assert from "node:assert/strict";
import path from "node:path";
import { mock, test } from "node:test";
import {
  bash_bootstrap_core_upgrade_steps,
  bash_detach_pacman_pkg_cache,
  Msys2Installer,
  wrapPacmanNonInteractiveCommand,
} from "../scripts/msys2-installer.ts";
import {
  dedupeDistPackageDir,
  parsePkgArchiveFilename,
} from "../scripts/utils.ts";

function makeInstaller(overrides = {}) {
  return new Msys2Installer(overrides);
}

function mockArguments(mockFn) {
  return mockFn.mock.calls.map((call) => call.arguments);
}

function spawnCalls(spawns) {
  return spawns.map((spawn) => ({
    command: spawn.command,
    args: spawn.args,
    cwd: spawn.options.cwd,
    env: spawn.options.env,
  }));
}

function captureCalls(captures) {
  return captures.map((capture) => [capture.command, capture.args]);
}

function processResult(stdout = "", code = 0) {
  return { stdout, stderr: "", code };
}

test("installMsys2BasePackages", async () => {
  const ci_tools_msys64_parent = "D:\\CI-Tools\\msys64-stage0";

  const spawns = [];
  const linkPacmanCache = mock.fn(async () => {});
  const clearMsys64 = mock.fn(async () => {});
  const installer = makeInstaller({
    clearMsys64,
    fsExistsAsync: mock.fn(async () => true),
    linkPacmanCache,
    runProcess: mock.fn(async (command, args, options) => {
      spawns.push({ command, args, options });
      return processResult();
    }),
  });

  const has_msys64 = await installer.installMsys2BasePackages(
    ci_tools_msys64_parent,
    false,
  );

  assert.deepEqual(
    {
      has_msys64,
      clearMsys64Calls: mockArguments(clearMsys64),
      linkPacmanCacheCalls: mockArguments(linkPacmanCache),
      runProcessCalls: spawnCalls(spawns),
    },
    {
      has_msys64: true,
      clearMsys64Calls: [],
      linkPacmanCacheCalls: [
        ["D:\\CI-Tools\\msys64-stage0\\msys64", true],
        ["D:\\CI-Tools\\msys64-stage0\\msys64"],
        ["D:\\CI-Tools\\msys64-stage0\\msys64", false],
        ["D:\\CI-Tools\\msys64-stage0\\msys64"],
      ],
      runProcessCalls: [
        ...bash_bootstrap_core_upgrade_steps.map((step) => ({
          command:
            "D:\\CI-Tools\\msys64-stage0\\msys64\\usr\\bin\\bash.exe",
          args: [
            "--login",
            "-c",
            wrapPacmanNonInteractiveCommand(step),
          ],
          cwd: "D:\\CI-Tools\\msys64-stage0\\msys64",
          env: {
            MSYS: "winsymlinks:native",
            MSYSTEM: "MSYS",
            CHERE_INVOKING: "1",
          },
        })),
        {
          command:
            "D:\\CI-Tools\\msys64-stage0\\msys64\\usr\\bin\\bash.exe",
          args: [
            "--login",
            "-c",
            wrapPacmanNonInteractiveCommand("pacman -Syu --noconfirm"),
          ],
          cwd: "D:\\CI-Tools\\msys64-stage0\\msys64",
          env: {
            MSYS: "winsymlinks:native",
            MSYSTEM: "MSYS",
            CHERE_INVOKING: "1",
          },
        },
      ],
    },
  );
});

test("clearMsys64 skips cache merge when bash is missing", async () => {
  const msys_root = "D:\\CI-Tools\\msys64-stage2\\msys64";

  const linkPacmanCache = mock.fn(async () => {});
  const rm = mock.fn(async () => {});
  const installer = makeInstaller({
    linkPacmanCache,
    fs: { rm },
    fsExistsAsync: mock.fn(async (target) => {
      if (target === msys_root) {
        return true;
      }
      if (target.endsWith("bash.exe")) {
        return false;
      }
      return false;
    }),
  });

  await installer.clearMsys64(msys_root);

  assert.deepEqual(
    {
      linkPacmanCacheCalls: mockArguments(linkPacmanCache),
      rmCalls: mockArguments(rm),
    },
    {
      linkPacmanCacheCalls: [],
      rmCalls: [[msys_root, { recursive: true, force: true }]],
    },
  );
});

test("installMsys2AllPackages", async () => {
  const ci_tools_msys64_parent = "D:\\CI-Tools\\msys64-stage0";
  const pkg_root_win = "D:\\work\\xemu\\CYGWIN-packages";
  const pkg_root_cygwin = "/d/work/xemu/CYGWIN-packages";

  const spawns = [];
  const captures = [];
  const linkPacmanCache = mock.fn(async () => {});
  const mkdir = mock.fn(async () => {});
  const writeFile = mock.fn(async () => {});
  const installMsys2BasePackages = mock.fn(async () => true);
  const installer = makeInstaller({
    installMsys2BasePackages,
    linkPacmanCache,
    runProcess: mock.fn(async (command, args, options) => {
      if (
        command ===
          "D:\\CI-Tools\\msys64-stage0\\msys64\\usr\\bin\\cygpath.exe" &&
        args[0] === pkg_root_win
      ) {
        captures.push({ command, args });
        return processResult(`${pkg_root_cygwin}\n`);
      }
      if (
        command ===
          "D:\\CI-Tools\\msys64-stage0\\msys64\\usr\\bin\\pacman.exe" &&
        args[0] === "-Sl" &&
        args[1] === "msys"
      ) {
        captures.push({ command, args });
        return processResult(
          "msys foo 1.0-1\n\nmsys uutils-coreutils 0.2.0-1\nmsys bar 2.0-1\n",
        );
      }
      spawns.push({ command, args, options });
      return processResult();
    }),
    fs: { mkdir, writeFile },
  });

  const has_msys64 = await installer.installMsys2AllPackages(
    ci_tools_msys64_parent,
    pkg_root_win,
    false,
  );

  assert.deepEqual(
    {
      has_msys64,
      installMsys2BasePackagesCalls: mockArguments(installMsys2BasePackages),
      runProcessCaptureCalls: captureCalls(captures),
      msysTxtMkdir: mockArguments(mkdir),
      msysTxtWrite: mockArguments(writeFile),
      linkPacmanCacheCalls: mockArguments(linkPacmanCache),
      runProcessCalls: spawnCalls(spawns),
    },
    {
      has_msys64: true,
      installMsys2BasePackagesCalls: [
        ["D:\\CI-Tools\\msys64-stage0", false],
      ],
      runProcessCaptureCalls: [
        [
          "D:\\CI-Tools\\msys64-stage0\\msys64\\usr\\bin\\cygpath.exe",
          ["D:\\work\\xemu\\CYGWIN-packages"],
        ],
        [
          "D:\\CI-Tools\\msys64-stage0\\msys64\\usr\\bin\\pacman.exe",
          ["-Sl", "msys"],
        ],
      ],
      msysTxtMkdir: [
        [
          "D:\\work\\xemu\\CYGWIN-packages\\scripts\\generated",
          { recursive: true },
        ],
      ],
      msysTxtWrite: [
        [
          "D:\\work\\xemu\\CYGWIN-packages\\scripts\\generated\\msys.txt",
          "foo\nbar",
          "utf-8",
        ],
      ],
      linkPacmanCacheCalls: [
        ["D:\\CI-Tools\\msys64-stage0\\msys64", false],
        ["D:\\CI-Tools\\msys64-stage0\\msys64"],
      ],
      runProcessCalls: [
        {
          command:
            "D:\\CI-Tools\\msys64-stage0\\msys64\\usr\\bin\\bash.exe",
          args: [
            "--login",
            "-c",
            wrapPacmanNonInteractiveCommand(
              "cd /d/work/xemu/CYGWIN-packages/; sed -i 's/^SigLevel.*$/SigLevel=Never/g' /etc/pacman.conf; cat /etc/pacman.conf | grep ^SigLevel; pacman -S --noconfirm --needed $(cat scripts/generated/msys.txt)",
            ),
          ],
          cwd: "D:\\work\\xemu\\CYGWIN-packages",
          env: {
            MSYS: "winsymlinks:native",
            MSYSTEM: "MSYS",
            CHERE_INVOKING: "1",
          },
        },
      ],
    },
  );
});

test("archiveFull", async () => {
  const ci_tools_msys64_parent = "D:\\CI-Tools\\msys64-stage0";
  const msys2_base_filename = "msys2-base-x86_64-20251213-full.tar";
  const ci_tools_msys64_parent_cygwin = "/d/CI-Tools/msys64-stage0";

  const spawns = [];
  const captures = [];
  const linkPacmanCache = mock.fn(async () => {});
  const rm = mock.fn(async () => {});
  const installer = makeInstaller({
    linkPacmanCache,
    fs: { rm },
    runProcess: mock.fn(async (command, args, options) => {
      if (
        command ===
          "D:\\CI-Tools\\msys64-stage0\\msys64\\usr\\bin\\cygpath.exe" &&
        args[0] === ci_tools_msys64_parent
      ) {
        captures.push({ command, args });
        return processResult(`${ci_tools_msys64_parent_cygwin}\n`);
      }
      spawns.push({ command, args, options });
      return processResult();
    }),
  });

  const result = await installer.archiveFull(
    ci_tools_msys64_parent,
    `${ci_tools_msys64_parent}\\msys64`,
    msys2_base_filename,
  );

  assert.deepEqual(
    {
      result,
      runProcessCaptureCalls: captureCalls(captures),
      rmCalls: mockArguments(rm),
      linkPacmanCacheCalls: mockArguments(linkPacmanCache),
      runProcessCalls: spawnCalls(spawns),
    },
    {
      result: "msys2-base-x86_64-20251213-full.tar",
      runProcessCaptureCalls: [
        [
          "D:\\CI-Tools\\msys64-stage0\\msys64\\usr\\bin\\cygpath.exe",
          ["D:\\CI-Tools\\msys64-stage0"],
        ],
      ],
      rmCalls: [
        [
          "D:\\CI-Tools\\msys64-stage0\\msys2-base-x86_64-20251213-full.tar",
          { force: true, recursive: true },
        ],
      ],
      linkPacmanCacheCalls: [["D:\\CI-Tools\\msys64-stage0\\msys64"]],
      runProcessCalls: [
        {
          command:
            "D:\\CI-Tools\\msys64-stage0\\msys64\\usr\\bin\\bash.exe",
          args: [
            "--login",
            "-c",
            [
              "rm -f /d/CI-Tools/msys64-stage0/msys2-base-x86_64-20251213-full.tar",
              bash_detach_pacman_pkg_cache,
              "mkdir -p /var/cache/pacman/pkg",
              "touch /var/cache/pacman/pkg/gitignore",
            ].join("; "),
          ],
          cwd: undefined,
          env: {
            MSYS: "winsymlinks:native",
            MSYSTEM: "MSYS",
            CHERE_INVOKING: "1",
          },
        },
        {
          command: "D:\\CI-Tools\\msys64-stage0\\msys64\\usr\\bin\\tar.exe",
          args: [
            "cf",
            "/d/CI-Tools/msys64-stage0/msys2-base-x86_64-20251213-full.tar",
            "msys64",
          ],
          cwd: "D:\\CI-Tools\\msys64-stage0",
          env: {
            MSYS: "winsymlinks:native",
            MSYSTEM: "MSYS",
            CHERE_INVOKING: "1",
          },
        },
      ],
    },
  );
});

test("parsePkgArchiveFilename parses msys2 package filenames", () => {
  assert.deepEqual(
    parsePkgArchiveFilename("binutils-2.46.1-6-x86_64.pkg.tar.zst"),
    {
      pkgname: "binutils",
      pkgver: "2.46.1",
      pkgrel: "6",
      arch: "x86_64",
      filename: "binutils-2.46.1-6-x86_64.pkg.tar.zst",
    },
  );
  assert.deepEqual(
    parsePkgArchiveFilename("mingw-w64-x86_64-clang-21.1.7-1-any.pkg.tar.zst"),
    {
      pkgname: "mingw-w64-x86_64-clang",
      pkgver: "21.1.7",
      pkgrel: "1",
      arch: "any",
      filename: "mingw-w64-x86_64-clang-21.1.7-1-any.pkg.tar.zst",
    },
  );
});

test("dedupeDistPackageDir keeps newest duplicate package file", async () => {
  const dist_dir = "D:\\work\\xemu\\CYGWIN-packages\\dist\\stage1";
  const files = new Map([
    [
      "binutils-2.46-6-x86_64.pkg.tar.zst",
      { mtimeMs: 1000 },
    ],
    [
      "binutils-2.46.1-6-x86_64.pkg.tar.zst",
      { mtimeMs: 2000 },
    ],
    [
      "gcc-15.3.0-6-x86_64.pkg.tar.zst",
      { mtimeMs: 3000 },
    ],
  ]);
  const removed_paths = [];
  const fsImpl = {
    async readdir() {
      return [...files.keys()];
    },
    async stat(target) {
      const entry = files.get(path.basename(target));
      return { mtimeMs: entry.mtimeMs };
    },
    async rm(target) {
      const filename = path.basename(target);
      files.delete(filename);
      removed_paths.push(filename);
    },
  };

  const removed = await dedupeDistPackageDir(dist_dir, fsImpl);

  assert.deepEqual(
    {
      removed,
      remaining: [...files.keys()],
      removed_paths,
    },
    {
      removed: ["binutils-2.46-6-x86_64.pkg.tar.zst"],
      remaining: [
        "binutils-2.46.1-6-x86_64.pkg.tar.zst",
        "gcc-15.3.0-6-x86_64.pkg.tar.zst",
      ],
      removed_paths: ["binutils-2.46-6-x86_64.pkg.tar.zst"],
    },
  );
});
