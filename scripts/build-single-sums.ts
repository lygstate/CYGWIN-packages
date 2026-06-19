import { exitWith, repoScript, runShellFile } from "./build-common.ts";

const env = {
  ...process.env,
  MSYS_BUILD_PKGSUMS: "enabled",
};

const code = await runShellFile(repoScript("sh", "single.sh"), process.argv.slice(2), env);
exitWith(code);
