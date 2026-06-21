import assert from "node:assert/strict";
import { mkdtemp, mkdir, writeFile } from "node:fs/promises";
import { tmpdir } from "node:os";
import { join } from "node:path";
import { test } from "node:test";
import {
  clearInstallPackageList,
  distPkgFileIsBuildOnly,
  pacmanUInstallListedCommand,
  readPackageList,
  shouldInstallToMsys,
} from "../scripts/single.ts";

test("shouldInstallToMsys skips packages_build_only ports", () => {
  assert.equal(shouldInstallToMsys("uutils-coreutils"), false);
  assert.equal(shouldInstallToMsys("gcc"), true);
});

test("distPkgFileIsBuildOnly matches pkgname and filename prefix", () => {
  assert.equal(
    distPkgFileIsBuildOnly("uutils-coreutils-0.0.30-1-x86_64.pkg.tar.zst"),
    true,
  );
  assert.equal(
    distPkgFileIsBuildOnly("gcc-15.3.0-6-x86_64.pkg.tar.zst"),
    false,
  );
});

test("readPackageList skips blanks and comments", async () => {
  const dir = await mkdtemp(join(tmpdir(), "cygwin-pkg-list-"));
  const listPath = join(dir, "list.txt");
  await writeFile(
    listPath,
    "# comment\n\ngcc\n\nbash\n",
    "utf-8",
  );
  assert.deepEqual(await readPackageList(listPath), ["gcc", "bash"]);
});

test("clearInstallPackageList writes an empty file", async () => {
  const dir = await mkdtemp(join(tmpdir(), "cygwin-pkg-clear-"));
  const listPath = join(dir, "stage2-install.txt");
  await writeFile(listPath, "gcc-1-1-x86_64.pkg.tar.zst\n", "utf-8");
  await clearInstallPackageList(listPath);
  assert.deepEqual(await readPackageList(listPath), []);
});

test("pacmanUInstallListedCommand builds pacman -U for installable packages", async () => {
  const dir = await mkdtemp(join(tmpdir(), "cygwin-pkg-cmd-"));
  const listPath = join(dir, "install.txt");
  await writeFile(
    listPath,
    "gcc-15.3.0-6-x86_64.pkg.tar.zst\nuutils-coreutils-0.0.30-1-x86_64.pkg.tar.zst\n",
    "utf-8",
  );
  const command = await pacmanUInstallListedCommand(listPath);
  assert.match(command, /^pacman -U --noconfirm --overwrite \\\* /);
  assert.match(command, /gcc-15.3.0-6-x86_64\.pkg\.tar\.zst/);
  assert.doesNotMatch(command, /uutils-coreutils/);
});

test("pacmanUInstallListedCommand returns true for missing list without distDir", async () => {
  const dir = await mkdtemp(join(tmpdir(), "cygwin-pkg-missing-"));
  const listPath = join(dir, "missing.txt");
  assert.equal(await pacmanUInstallListedCommand(listPath), "true");
});

test("pacmanUInstallListedCommand throws when list empty but dist has packages", async () => {
  const dir = await mkdtemp(join(tmpdir(), "cygwin-pkg-empty-"));
  const listPath = join(dir, "install.txt");
  const distDir = join(dir, "dist");
  await mkdir(distDir, { recursive: true });
  await writeFile(listPath, "", "utf-8");
  await writeFile(
    join(distDir, "gcc-15.3.0-6-x86_64.pkg.tar.zst"),
    "",
    "utf-8",
  );
  await assert.rejects(
    () => pacmanUInstallListedCommand(listPath, distDir),
    /Install list .* has no installable packages but .* has 1/,
  );
});

test("pacmanUInstallListedCommand allows empty list when dist is empty", async () => {
  const dir = await mkdtemp(join(tmpdir(), "cygwin-pkg-empty-dist-"));
  const listPath = join(dir, "install.txt");
  const distDir = join(dir, "dist");
  await mkdir(distDir, { recursive: true });
  await writeFile(listPath, "", "utf-8");
  assert.equal(await pacmanUInstallListedCommand(listPath, distDir), "true");
});
