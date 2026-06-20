import * as fs from "fs/promises";
import * as fsSync from "fs";
import * as path from "path";
import process from "node:process";
import {
  black_list,
  ci_tools_msys64_stage0,
} from "./build-config.ts";
import {
  type RunContext,
} from "./run-context.ts";
import {
  repoPath,
  repoRoot,
} from "./utils.ts";

let need_exit = false;
process.on("SIGINT", function () {
  console.log("Caught interrupt signal");
  need_exit = true;
});

export async function runDeps(step: RunContext) {
  const run = step.run.bind(step);
  const portsDir = repoPath("ports");
  const generatedDir = repoPath("scripts", "generated");
  const packages_list = await fs.readdir(portsDir);
  let script = "";
  for (let pkg_name of packages_list) {
    const fullUrl = path.join(portsDir, pkg_name, "PKGBUILD");
    if (!fsSync.existsSync(fullUrl)) {
      console.log(`Invalid ${fullUrl}`);
      continue;
    }
    script += `pkgrel=\n`;
    script += `pkgver=\n`;
    script += `pkgname=()\n`;
    script += `pkgbase=\n`;
    script += `makedepends=()\n`;
    script += `source ./ports/${pkg_name}/PKGBUILD; echo "{\\\"makedepends\\\": \\\"\${makedepends[*]}\\\", \\\"pkgrel\\\": \\\"\${pkgrel}\\\", \\\"pkgver\\\": \\\"\${pkgver}\\\", \\\"dir\\\": \\\"${pkg_name}\\\", \\\"pkgname\\\": \\\"\${pkgname[*]}\\\", \\\"pkgbase\\\": \\\"\${pkgbase}\\\"}"\n`;
  }
  await fs.writeFile(path.join(repoRoot, "pkg_info.sh"), script);
  const pkg_info = await run(
    `${ci_tools_msys64_stage0}/msys64/usr/bin/bash.exe`,
    ["--login", "-c", "source pkg_info.sh"],
    {
      cwd: repoRoot,
      env: {
        CHERE_INVOKING: "1",
      },
    },
  );
  console.log(`All path checked`);
  console.log(pkg_info.stdout);

  const msys_packages = repoPath("scripts", "generated", "msys.txt");
  const packages = await fs.readFile(msys_packages, "utf-8");

  const deps_map = {};
  for (let pkg_name of packages.trim().split("\n")) {
    if (black_list.has(pkg_name)) continue;
    if (pkg_name == undefined) {
      continue;
    }
    if (need_exit) {
      break;
    }
    const deps = await run(
      `${ci_tools_msys64_stage0}/msys64/usr/bin/pactree.exe`,
      [pkg_name, "-u", "-d", "1"],
    );
    console.log(`Deps for ${pkg_name} is :[\n${deps.stdout}\n]`);
    deps_map[pkg_name] = deps.stdout.trim().split("\n").slice(1);
  }
  await fs.mkdir(generatedDir, { recursive: true });
  await fs.writeFile(
    repoPath("scripts", "generated", "deps.json"),
    JSON.stringify(
      {
        pkg_info: JSON.parse(
          "[" + pkg_info.stdout.trim().split("\n").join(",") + "]",
        ),
        deps_map: deps_map,
      },
      null,
      2,
    ),
  );
}
