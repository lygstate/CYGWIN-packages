import * as path from "path";
import {
  archiveFull,
  installMsys2BasePackages,
  installMsys2StageBatchScripts,
  executePacmanInstall,
  ci_tools_msys64_stage3,
  repoRoot,
  dedupeDistPackageDir,
} from "./utils.ts";

process.on("SIGINT", function () {
  console.log("Caught interrupt signal");
  process.exit(-1);
});

async function main() {
  const msys_root = path.join(ci_tools_msys64_stage3, "msys64");
  const pkg_root = repoRoot;
  const stage1_dist = path.join(pkg_root, "dist", "stage1");
  const stage2_dist = path.join(pkg_root, "dist", "stage2");

  const has_msys64 = await installMsys2BasePackages(
    ci_tools_msys64_stage3,
    true,
  );

  const removed_stage1 = await dedupeDistPackageDir(stage1_dist);
  console.log(
    `===Removed ${removed_stage1.length} duplicate package(s) from dist/stage1`,
  );
  const removed_stage2 = await dedupeDistPackageDir(stage2_dist);
  console.log(
    `===Removed ${removed_stage2.length} duplicate package(s) from dist/stage2`,
  );

  const install_commands = [
    "pacman -U --noconfirm --overwrite \\* `ls | tr '\n' ' '`",
    "pacman -U --noconfirm --overwrite \\* `ls | tr '\n' ' '`",
  ];
  for (let i = 0; i < install_commands.length; i += 1) {
    await executePacmanInstall(
      msys_root,
      install_commands[i],
      stage1_dist,
    );
  }
  await executePacmanInstall(
    msys_root,
    "pacman -U --noconfirm --overwrite \\* `ls | tr '\n' ' '`",
    stage2_dist,
  );
  console.log("===stage3: Switch to cygwin finished");
  const msys2_base_filename = await archiveFull(
    ci_tools_msys64_stage3,
    msys_root,
  );
  console.log(
    `===stage3: Archive finished as: ${msys2_base_filename} with has_msys64:${has_msys64}`,
  );
  await installMsys2StageBatchScripts(
    ci_tools_msys64_stage3,
    msys2_base_filename,
  );
  console.log(`===stage3: Wrote extract.bat and delete-msys64.bat`);
}

main().catch((error) => {
  console.error(error);
  process.exit(1);
});
