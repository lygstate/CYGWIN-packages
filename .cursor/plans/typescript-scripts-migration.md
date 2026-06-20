# TypeScript Scripts Migration

## Overview

Migrate the repo's root build orchestration and existing `.mjs` tooling into
TypeScript under `scripts/`, while preserving root-level build command
compatibility through thin stubs. Node will run TypeScript sources directly;
Vite will be added for build/check tooling, not as the runtime path.

## Scope

- Move the real implementations of root build entry points into `scripts/` as
  TypeScript.
- Move all current `.mjs` code into `scripts/` as TypeScript, including tests
  under `scripts/test/` or `test/` with updated imports.
- Keep `scripts/build-all.ts` as the single build entrypoint and remove root
  `build-all.bat` / `build*.sh` compatibility stubs.
- Keep generated stage package lists under `scripts/generated/`.
- Do not migrate `build-install/*.sh`, docs such as `BUILD.md`, log files, or
  patch files containing `build` in their names.

## Tooling Shape

- Use Yarn for package management.
- Add `typescript`, `vite`, and `@types/node` as dev dependencies with Yarn.
- Add `tsconfig.json` for Node-native TypeScript with ESM imports and strict
  enough checks to catch migration mistakes.
- Add `vite.config.ts` with script entry points for validation/build artifacts
  only.
- Update `package.json` scripts:
  - `test`: run Node's test runner against TypeScript tests.
  - `check`: run TypeScript type checking.
  - `build`: run Vite build for script validation/output.
  - `lint`: use the available TypeScript check unless the repo later chooses
    ESLint.

## Source Layout

- Create `scripts/utils.ts` from `utils.mjs` and add shared helpers for:
  - `repoRoot`, computed as the parent of `scripts/`.
  - resolving repo paths like `ports/`, `ports-mingw/`, `dist/`, `dist-pkg/`,
    `build-cache/`, and generated files.
  - running commands with the current Windows/MSYS environment rules.
- Convert current `.mjs` entry points to TypeScript in `scripts/`:
  - `check.mjs` -> `scripts/check.ts`
  - `deps.mjs` -> `scripts/deps.ts`
  - `gen-build-all.mjs` -> `scripts/gen-build-all.ts`
  - `install-for-stage0.mjs` -> `scripts/install-for-stage0.ts`
  - `install-for-stage2.mjs` -> `scripts/install-for-stage2.ts`
  - `install-for-stage3.mjs` -> `scripts/install-for-stage3.ts`
  - `install-mingw-for-stage3.mjs` -> `scripts/install-mingw-for-stage3.ts`
- Update imports from `./utils.mjs` to TypeScript module imports under
  `scripts/`.

## Build Script Migration

- Convert shell/batch implementations into TypeScript orchestration where
  practical, preserving behavior and log names.
- Keep `scripts/build-all.ts` as the single build entrypoint.
- Preserve existing CLI/environment contracts, especially:
  - internal single-package builds use `scripts/sh/single.sh <pkg>`
  - `MSYS_BOOTSTRAP_STAGE`, `MSYS_BUILD_PKGSUMS`, `MSYS_CLEAN_TYPE`,
    `MSYS_BUILD_NO_EXTRACT`, `MSYS_BOOTSTRAP_EXIT_ON_ERROR`
  - output logs under `scripts/logs/` (e.g. `build-stage0.txt`,
    `build-stage1.txt`, `build-stage2.txt`)
- For scripts that are currently sourced, handle exported environment
  carefully. `scripts/sh/check-bootstrap.sh` is the key risk because callers
  expect it to set shell variables.
- Preserve generated output locations at repo root:
  - `scripts/generated/deps.json`
  - `scripts/generated/msys.txt`
  - `pkg_info.sh`
  - `scripts/generated/deps-map-make.json`
  - `scripts/generated/stage1-list.sh`
  - `scripts/generated/stage2-list.sh`

## Consolidation plan (single entrypoint)

Runtime entry is already `start.bat` -> `scripts/build-all.ts`. Remaining
work is to fold duplicate scripts into that pipeline and drop manual pre-steps.

### Target pipeline order

`deps.ts` and `gen-build-all.ts` belong **in the pipeline immediately after
stage0 install**, not as a manual pre-build. Rationale:

- `install-for-stage0.ts` creates `msys64-stage0` and writes
  `scripts/generated/msys.txt` via `installMsys2AllPackages`.
- `deps.ts` needs that tree (`pactree`, `bash` under `msys64-stage0`) and
  `scripts/generated/msys.txt`.
- `gen-build-all.ts` reads `scripts/generated/deps.json` and writes
  `stage1-list.sh` / `stage2-list.sh`, which `stage1.sh` and stage2 list
  steps require.

Proposed step sequence (new step ids in **bold**):

1. `stage0-install` -- `install-for-stage0.ts` (install MSYS packages, archive,
   write `extract.bat`; leave `msys64-stage0` on disk)
2. **`stage0-generate`** -- `deps.ts` then `gen-build-all.ts`
3. `stage0-extract` -- extract `msys64-stage0` from archive (same as today)
4. `hook-runtime` -- runtime hook + `stage0.sh`
5. `stage1` -- `stage1.sh` (uses `scripts/generated/stage1-list.sh`)
6. `stage2-prep` .. `stage3-mingw` -- unchanged

Logs for the new step: `scripts/logs/deps.txt`, `scripts/logs/gen-build-all.txt`.

Resume: `--from stage1` and later assume `scripts/generated/deps.json` and
stage list scripts already exist. Re-run `--from stage0-generate` after port
dependency changes.

### Merge into `build-all.ts` (or `scripts/install-stages.ts`)

| Current file | Action |
|--------------|--------|
| `scripts/install-stages.ts` | Exports `installStage0/2/3`, `installMingwStage3`; called from pipeline |
| `deps.ts` | Export `runDeps()`; CLI + `stage0-generate` step |
| `gen-build-all.ts` | Export `runGenBuildAll()`; CLI + `stage0-generate` step |

Keep `deps.ts` and `gen-build-all.ts` as modules; drop standalone `main()`
spawn from `build-all.ts` once folded.

### Remove or trim

| Item | Action |
|------|--------|
| `scripts/sh/stage2-list-extra.sh` | Removed (was empty) |
| Dead `do_build()` / `do_other()` in `stage0.sh`, `stage-hook.sh`, `stage1.sh` | Delete or move to BUILD-START manual recipes |
| `runShellFile` in `build-common.ts` | Remove if unused |
| `scripts/check.ts` | Restore or remove from `vite.config.ts` / `package.json` main |

### Keep at makepkg boundary

- `scripts/sh/single.sh`, `check-bootstrap.sh`, `stage0.sh`, `stage-hook.sh`,
  `bootstrap-init-stage1.sh`, `stage1.sh`
- `utils.ts`, `build-common.ts`, pre-build module code for deps/gen (invoked
  from pipeline, not run by hand)

### Implementation phases

1. ~~Add `stage0-generate` pipeline step (wire `deps.ts` + `gen-build-all.ts`).~~ Done.
2. ~~Split `stage0-prep` into install / generate / extract; update `--from` help.~~ Done.
3. ~~Merge four install scripts into `install-stages.ts`; import from `build-all.ts`.~~ Done.
4. ~~Remove empty `stage2-list-extra` pipeline step.~~ Done.
5. Optional: trim dead shell blocks in `stage0.sh`, `stage-hook.sh`, `stage1.sh`.
6. `deps.ts` and `gen-build-all.ts` remain runnable as CLI for manual regen.

### Risks

- `deps.ts` is slow (one `pactree` per package); running every full bootstrap
  is expected; cache `deps.json` when resuming from later steps.
- Log paths under `scripts/logs/` and generated paths under `scripts/generated/`
  are documented contracts; preserve names when folding scripts.
- `CI_TOOLS_ROOT` must match between `build-all.ts` and install/deps paths.

## Reference Updates

- Update bootstrap documentation to use `node scripts/build-all.ts`.
- Update `README-bootstrap.md` references from `.mjs` and root build
  implementation details to the new TypeScript commands while keeping old root
  entry points documented as compatibility commands.
- Update `package.json` from CommonJS/stale `main` toward the new script
  commands.
- Update `test/utils-install-base.test.mjs` to TypeScript and import from
  `scripts/utils.ts`.

## Validation

- Run the focused Node test suite after conversion with Yarn.
- Run TypeScript checking with Yarn.
- Run Vite build/check script with Yarn.
- Smoke-test non-destructive entry points where possible, such as
  `node scripts/check.ts` and generated-list creation if inputs are present.
- Do not run the full bootstrap build unless explicitly requested.

## Todo List

- Confirm every root build entry point and generated output contract before
  moving code.
- Add TypeScript, Vite, Node type tooling, and package scripts with Yarn.
- Convert all `.mjs` files to TypeScript under `scripts/` and update
  imports/tests.
- Move build orchestration implementations into `scripts/` and leave root
  compatibility stubs.
- Replace script-directory-as-root assumptions with an explicit repo root
  helper.
- Add `stage0-generate` pipeline step: run `deps.ts` + `gen-build-all.ts`
  after `install-for-stage0.ts`.
- ~~Merge install scripts into `install-stages.ts` and call from `build-all.ts`.~~
- Update README/package references to the new TypeScript commands and
  compatibility wrappers.
- Run focused tests, type checks, Vite build, and lightweight smoke checks.
