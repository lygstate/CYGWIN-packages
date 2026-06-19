import { exitWith, repoScript, runShellFile } from "./build-common.ts";

const code = await runShellFile(repoScript("sh", "stage1.sh"));
exitWith(code);
