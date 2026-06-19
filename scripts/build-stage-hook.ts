import { exitWith, repoScript, runShellFile } from "./build-common.ts";

const code = await runShellFile(repoScript("sh", "stage-hook.sh"));
exitWith(code);
