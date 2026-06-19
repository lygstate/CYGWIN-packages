import { exitWith, repoScript, runShellFile } from "./build-common.ts";

const code = await runShellFile(repoScript("sh", "single.sh"), process.argv.slice(2));
exitWith(code);
