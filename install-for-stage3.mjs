import * as path from "path";
import { fileURLToPath } from "url";
import {
  spawnProcessAsyncCapture,
  archiveFull,
  installMsys2BasePackages,
  installMsys2StageBatchScripts,
  executePacmanInstall,
  ci_tools_msys64_stage3,
} from "./utils.mjs";

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

process.on("SIGINT", function () {
  console.log("Caught interrupt signal");
  process.exit(-1);
});

async function main() {
  const msys_root = path.join(ci_tools_msys64_stage3, "msys64");
  const pkg_root = __dirname;
  const has_msys64 = await installMsys2BasePackages(
    ci_tools_msys64_stage3,
    true,
  );

  const install_commands = [
    "pacman -U --noconfirm --overwrite \\* `ls | tr '\n' ' '`",
    "pacman -U --noconfirm --overwrite \\* `ls | tr '\n' ' '`",
  ];
  for (let i = 0; i < install_commands.length; i += 1) {
    // reset the pacman cache folder
    await executePacmanInstall(
      msys_root,
      install_commands[i],
      path.join(pkg_root, "dist", "stage1"),
    );
  }
  await executePacmanInstall(
    msys_root,
    "pacman -U --noconfirm --overwrite \\* `ls | tr '\n' ' '`",
    path.join(pkg_root, "dist", "stage2"),
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

main();
