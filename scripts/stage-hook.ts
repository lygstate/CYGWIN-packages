import {
  type RunContext,
} from "./run-context.ts";
import { repoRoot, type Msys64Stage } from "./utils.ts";

export async function runStageHook(step: RunContext, stage: Msys64Stage) {
  await step.run(
    stage.bash,
    ["--login", "-c", "source scripts/sh/stage-hook-build.sh"],
    { cwd: repoRoot, env: stage.env },
  );
}
