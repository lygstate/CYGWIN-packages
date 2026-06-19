import * as path from "path";
import process from "node:process";
import {
  ci_tools_msys64_stage0,
  repoRoot,
  archiveFull,
  installMsys2AllPackages,
  installMsys2StageBatchScripts,
} from "./utils.ts";

process.on("SIGINT", function () {
  console.log("Caught interrupt signal");
  process.exit(-1);
});

async function main() {
  const msys_root = path.join(ci_tools_msys64_stage0, "msys64");
  const pkg_root = repoRoot;

  const has_msys64 = await installMsys2AllPackages(
    ci_tools_msys64_stage0,
    pkg_root,
    true,
  );

  const msys2_base_filename = await archiveFull(
    ci_tools_msys64_stage0,
    msys_root,
  );
  console.log(
    `===stage0: Archive finished as: ${msys2_base_filename} with has_msys64:${has_msys64}`,
  );
  await installMsys2StageBatchScripts(
    ci_tools_msys64_stage0,
    msys2_base_filename,
  );
  console.log(`===stage0: Wrote extract.bat and delete-msys64.bat`);
}

main().catch((error) => {
  console.error(error);
  process.exit(1);
});
