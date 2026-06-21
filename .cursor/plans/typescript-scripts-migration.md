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
  - `install-for-stage0.mjs` -> `scripts/install-stages.ts` (`installStage1`)
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
  - output logs under `scripts/logs/` (one file per pipeline step id, e.g.
    `stage1-install-prep.txt`, `stage1-list.txt`, `stage2-gcc.txt`)
- For scripts that are currently sourced, handle exported environment
  carefully. `scripts/sh/check-bootstrap.sh` is the key risk because callers
  expect it to set shell variables.
- Preserve generated output locations at repo root:
  - `scripts/generated/deps.json`
  - `scripts/generated/msys.txt`
  - `pkg_info.sh`
  - `scripts/generated/deps-map-make.json`
  - `scripts/generated/stage1-list.txt`
  - `scripts/generated/stage2-list.txt`

## Consolidation plan (single entrypoint)

Runtime entry is already `start.bat` -> `scripts/build-all.ts`. Remaining
work is to fold duplicate scripts into that pipeline and drop manual pre-steps.

### Target pipeline order (current)

Entry: `start.bat` -> `scripts/build-all.ts` -> `scripts/start.ts`.

`deps.ts` and `gen-build-all.ts` run in `stage1-deps` and `stage1-gen-lists`
immediately after `stage1-install-prep` (install into `msys64-stage1`).

1. `stage1-install-prep` -- `installStage1()` in `install-stages.ts`
2. `stage1-deps` / `stage1-gen-lists` -- `deps.ts`, `gen-build-all.ts`
3. `stage1-extract` -- extract `msys64-stage1` from archive
4. `stage1-rt-origin-build`, `stage1-rt-origin-install`, `stage1-rt-hook-build`,
   `stage1-rt-hook-install`, `stage1-core-build`
5. `stage1-init`, `stage1-list` -- uses `scripts/generated/stage1-list.txt`
6. `stage2-*`, `stage3-*` -- unchanged layout; see `start.ts --help`

Logs: `scripts/logs/<step-id>.txt`. Resume with `--from <step-id>`.

Re-run `--from stage1-deps` after port dependency changes.

### Merge into `build-all.ts` (or `scripts/install-stages.ts`)

| Current file | Action |
|--------------|--------|
| `scripts/install-stages.ts` | Exports `installStage1/2/3`, `installMingwStage3`; called from pipeline |
| `deps.ts` | Export `runDeps()`; CLI + `stage1-deps` step |
| `gen-build-all.ts` | Export `runGenBuildAll()`; CLI + `stage1-gen-lists` step |

Keep `deps.ts` and `gen-build-all.ts` as modules; drop standalone `main()`
spawn from `build-all.ts` once folded.

### Remove or trim

| Item | Action |
|------|--------|
| `scripts/sh/stage2-list-extra.sh` | Removed (was empty) |
| Dead legacy shell orchestrators (`stage0.sh`, `stage1.sh`, etc.) | Removed; pipeline uses `start.ts` + `runPackageList` |
| `runShellFile` in `build-common.ts` | Remove if unused |
| `scripts/check.ts` | Restore or remove from `vite.config.ts` / `package.json` main |

### Keep at makepkg boundary

- `scripts/sh/single.sh`, `check-bootstrap.sh`, `stage1-init.sh`,
  `bootstrap-init-stage1.sh`
- `utils.ts`, `build-common.ts`, pre-build module code for deps/gen (invoked
  from pipeline, not run by hand)

### Implementation phases

1. ~~Add `stage1-deps` / `stage1-gen-lists` pipeline steps.~~ Done.
2. ~~Split stage1 prep into install / generate / extract; update `--from` help.~~ Done.
3. ~~Merge four install scripts into `install-stages.ts`; import from `build-all.ts`.~~ Done.
4. ~~Remove empty `stage2-list-extra` pipeline step.~~ Done.
5. ~~Optional: trim dead shell blocks in legacy stage shell scripts.~~ Done.
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
- ~~Add `stage1-deps` / `stage1-gen-lists` pipeline steps.~~ Done.
- ~~Merge install scripts into `install-stages.ts` and call from `build-all.ts`.~~
- Update README/package references to the new TypeScript commands and
  compatibility wrappers.
- Run focused tests, type checks, Vite build, and lightweight smoke checks.
