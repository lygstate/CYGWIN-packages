import { exitWith, repoScript, runShellFile } from "./build-common.ts";

const env = {
  ...process.env,
  MSYS_BOOTSTRAP_STAGE: "stage2",
};

const code = await runShellFile(
  repoScript("sh", "single.sh"),
  process.argv.slice(2),
  env,
);
exitWith(code);
