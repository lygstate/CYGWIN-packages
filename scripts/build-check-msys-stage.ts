import { exitWith, repoScript, runShellFile } from "./build-common.ts";

const code = await runShellFile(repoScript("sh", "check-msys-stage.sh"));
exitWith(code);
