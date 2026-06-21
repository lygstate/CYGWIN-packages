import * as fs from "fs/promises";
import * as path from "path";
import { fileURLToPath } from "url";
import { PKG_ARCHES, PKG_ARCHIVE_SUFFIX } from "./build-config.ts";

const scriptDir = path.dirname(fileURLToPath(import.meta.url));

export const repoRoot = path.resolve(scriptDir, "..");

const ciToolsRoot = process.env.CI_TOOLS_ROOT || "D:\\CI-Tools";
const pathOld = process.env.PATH || "";

export function repoPath(...parts: string[]) {
  return path.join(repoRoot, ...parts);
}

export type Msys64Stage = {
  stageDir: string;
  bash: string;
  dash: string;
  env: NodeJS.ProcessEnv;
};

export function initMsys64Stage(
  stage: "stage1" | "stage2" | "stage3",
  bootstrapEnv: NodeJS.ProcessEnv = {},
): Msys64Stage {
  const stageDir = path.join(ciToolsRoot, `msys64-${stage}`);
  const bash = path.join(stageDir, "msys64", "usr", "bin", "bash.exe");
  const dash = path.join(stageDir, "msys64", "usr", "bin", "dash.exe");
  const stagePaths = {
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
      ...bootstrapEnv,
    },
  };
  console.log(`The ${stage} PATH is:${stagePaths.env.PATH}`);
  return stagePaths;
}

export function parsePkgArchiveFilename(filename) {
  if (!filename.endsWith(PKG_ARCHIVE_SUFFIX)) {
    return null;
  }
  const base = filename.slice(0, -PKG_ARCHIVE_SUFFIX.length);
  const archSep = base.lastIndexOf("-");
  if (archSep <= 0) {
    return null;
  }
  const arch = base.slice(archSep + 1);
  if (!PKG_ARCHES.includes(arch as (typeof PKG_ARCHES)[number])) {
    return null;
  }
  const rest = base.slice(0, archSep);
  const relSep = rest.lastIndexOf("-");
  if (relSep <= 0) {
    return null;
  }
  const pkgrel = rest.slice(relSep + 1);
  if (!/^\d+$/.test(pkgrel)) {
    return null;
  }
  const nameVer = rest.slice(0, relSep);
  const verSep = nameVer.lastIndexOf("-");
  if (verSep <= 0) {
    return null;
  }
  return {
    pkgname: nameVer.slice(0, verSep),
    pkgver: nameVer.slice(verSep + 1),
    pkgrel,
    arch,
    filename,
  };
}

export async function dedupeDistPackageDir(dist_dir, fsImpl: any = fs) {
  let names;
  try {
    names = await fsImpl.readdir(dist_dir);
  } catch (e) {
    return [];
  }

  const groups = new Map();
  for (const filename of names) {
    const parsed = parsePkgArchiveFilename(filename);
    if (!parsed) {
      continue;
    }
    const key = `${parsed.pkgname}-${parsed.arch}`;
    const full_path = path.join(dist_dir, filename);
    const stat = await fsImpl.stat(full_path);
    if (!groups.has(key)) {
      groups.set(key, []);
    }
    groups.get(key).push({ ...parsed, mtimeMs: stat.mtimeMs, full_path });
  }

  const removed = [];
  for (const files of groups.values()) {
    if (files.length <= 1) {
      continue;
    }
    files.sort((a, b) => b.mtimeMs - a.mtimeMs);
    const [, ...dupes] = files;
    for (const dupe of dupes) {
      await fsImpl.rm(dupe.full_path);
      removed.push(dupe.filename);
      console.log(`===Removed duplicate package ${dupe.filename}`);
    }
  }
  return removed;
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
