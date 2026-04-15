import * as path from "path";
import { fileURLToPath } from "url";
import process from "node:process";
import {
  ci_tools_msys64_parent_basic,
  spawnProcessAsyncCapture,
  archiveFull,
  installMsys2AllPackages,
  installMsys2ExtractScript,
} from "./utils.mjs";

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

process.on("SIGINT", function () {
  console.log("Caught interrupt signal");
  process.exit(-1);
});

async function main() {
  const ci_tools_msys64_parent = ci_tools_msys64_parent_basic;
  const msys_root = path.join(ci_tools_msys64_parent, "msys64");
  const pkg_root = __dirname;

  const has_msys64 = await installMsys2AllPackages(
    ci_tools_msys64_parent,
    pkg_root,
    true,
  );

  const ci_tools_msys64_parent_cygwin = (
    await spawnProcessAsyncCapture(`${msys_root}/usr/bin/cygpath.exe`, [
      ci_tools_msys64_parent,
    ])
  ).stdout.trim();

  const msys2_base_filename = await archiveFull(
    ci_tools_msys64_parent,
    msys_root,
    ci_tools_msys64_parent_cygwin,
  );
  console.log(
    `===stage2: Archive finished as: ${msys2_base_filename} with has_msys64:${has_msys64}`,
  );
  await installMsys2ExtractScript(ci_tools_msys64_parent, msys2_base_filename);
  console.log(`===stage0: Install extract script finished`);
}

main();
