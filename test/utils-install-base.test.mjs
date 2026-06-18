import assert from "node:assert/strict";
import { mock, test } from "node:test";
import {
  Msys2Installer,
  bash_bootstrap_core_upgrade,
  bash_detach_pacman_pkg_cache,
} from "../utils.mjs";

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

test("installMsys2BasePackages", async () => {
  const ci_tools_msys64_parent = "D:\\CI-Tools\\msys64-stage0";

  const spawns = [];
  const linkPacmanCache = mock.fn(async () => {});
  const clearMsys64 = mock.fn(async () => {});
  const installer = makeInstaller({
    clearMsys64,
    fsExistsAsync: mock.fn(async () => true),
    linkPacmanCache,
    spawnProcessAsync: mock.fn(async (command, args, options) => {
      spawns.push({ command, args, options });
      return 0;
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
      spawnProcessAsyncCalls: spawnCalls(spawns),
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
      spawnProcessAsyncCalls: [
        {
          command:
            "D:\\CI-Tools\\msys64-stage0\\msys64\\usr\\bin\\bash.exe",
          args: ["--login", "-c", bash_bootstrap_core_upgrade],
          cwd: "D:\\CI-Tools\\msys64-stage0\\msys64",
          env: {
            MSYS: "winsymlinks:native",
            MSYSTEM: "MSYS",
            CHERE_INVOKING: "1",
          },
        },
        {
          command:
            "D:\\CI-Tools\\msys64-stage0\\msys64\\usr\\bin\\bash.exe",
          args: ["--login", "-c", "pacman -Syu --noconfirm"],
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

test("installMsys2AllPackages", async () => {
  const ci_tools_msys64_parent = "D:\\CI-Tools\\msys64-stage0";
  const pkg_root_win = "D:\\work\\xemu\\CYGWIN-packages";
  const pkg_root_cygwin = "/d/work/xemu/CYGWIN-packages";

  const spawns = [];
  const linkPacmanCache = mock.fn(async () => {});
  const writeFile = mock.fn(async () => {});
  const installMsys2BasePackages = mock.fn(async () => true);
  const installer = makeInstaller({
    installMsys2BasePackages,
    linkPacmanCache,
    spawnProcessAsyncCapture: mock.fn(async (command, args) => {
      if (
        command ===
          "D:\\CI-Tools\\msys64-stage0\\msys64\\usr\\bin\\cygpath.exe" &&
        args[0] === pkg_root_win
      ) {
        return {
          stdout: `${pkg_root_cygwin}\n`,
          stderr: "",
          code: 0,
        };
      }
      if (
        command ===
          "D:\\CI-Tools\\msys64-stage0\\msys64\\usr\\bin\\pacman.exe" &&
        args[0] === "-Sl" &&
        args[1] === "msys"
      ) {
        return {
          stdout:
            "msys foo 1.0-1\n\nmsys uutils-coreutils 0.2.0-1\nmsys bar 2.0-1\n",
          stderr: "",
          code: 0,
        };
      }
      throw new Error(`Unexpected capture call: ${command} ${args.join(" ")}`);
    }),
    spawnProcessAsync: mock.fn(async (command, args, options) => {
      spawns.push({ command, args, options });
      return 0;
    }),
    fs: { writeFile },
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
      spawnProcessAsyncCaptureCalls: mockArguments(
        installer.spawnProcessAsyncCapture,
      ),
      msysTxtWrite: mockArguments(writeFile),
      linkPacmanCacheCalls: mockArguments(linkPacmanCache),
      spawnProcessAsyncCalls: spawnCalls(spawns),
    },
    {
      has_msys64: true,
      installMsys2BasePackagesCalls: [
        ["D:\\CI-Tools\\msys64-stage0", false],
      ],
      spawnProcessAsyncCaptureCalls: [
        [
          "D:\\CI-Tools\\msys64-stage0\\msys64\\usr\\bin\\cygpath.exe",
          ["D:\\work\\xemu\\CYGWIN-packages"],
        ],
        [
          "D:\\CI-Tools\\msys64-stage0\\msys64\\usr\\bin\\pacman.exe",
          ["-Sl", "msys"],
        ],
      ],
      msysTxtWrite: [
        [
          "D:\\work\\xemu\\CYGWIN-packages\\msys.txt",
          "foo\nbar",
          "utf-8",
        ],
      ],
      linkPacmanCacheCalls: [
        ["D:\\CI-Tools\\msys64-stage0\\msys64", false],
        ["D:\\CI-Tools\\msys64-stage0\\msys64"],
      ],
      spawnProcessAsyncCalls: [
        {
          command:
            "D:\\CI-Tools\\msys64-stage0\\msys64\\usr\\bin\\bash.exe",
          args: [
            "--login",
            "-c",
            "cd /d/work/xemu/CYGWIN-packages/; sed -i 's/^SigLevel.*$/SigLevel=Never/g' /etc/pacman.conf; cat /etc/pacman.conf | grep ^SigLevel; pacman -S --noconfirm --needed $(cat msys.txt)",
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
  const linkPacmanCache = mock.fn(async () => {});
  const rm = mock.fn(async () => {});
  const installer = makeInstaller({
    linkPacmanCache,
    fs: { rm },
    spawnProcessAsyncCapture: mock.fn(async (command, args) => {
      if (
        command ===
          "D:\\CI-Tools\\msys64-stage0\\msys64\\usr\\bin\\cygpath.exe" &&
        args[0] === ci_tools_msys64_parent
      ) {
        return {
          stdout: `${ci_tools_msys64_parent_cygwin}\n`,
          stderr: "",
          code: 0,
        };
      }
      throw new Error(`Unexpected capture call: ${command} ${args.join(" ")}`);
    }),
    spawnProcessAsync: mock.fn(async (command, args, options) => {
      spawns.push({ command, args, options });
      return 0;
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
      spawnProcessAsyncCaptureCalls: mockArguments(
        installer.spawnProcessAsyncCapture,
      ),
      rmCalls: mockArguments(rm),
      linkPacmanCacheCalls: mockArguments(linkPacmanCache),
      spawnProcessAsyncCalls: spawnCalls(spawns),
    },
    {
      result: "msys2-base-x86_64-20251213-full.tar",
      spawnProcessAsyncCaptureCalls: [
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
      spawnProcessAsyncCalls: [
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
