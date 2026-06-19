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
- Keep generated stage package lists under `scripts/sh/`.
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
  - output logs like `build-stage0.txt`, `build-stage1.txt`,
    `build-stage2.txt`
- For scripts that are currently sourced, handle exported environment
  carefully. `scripts/sh/check-bootstrap.sh` is the key risk because callers
  expect it to set shell variables.
- Preserve generated output locations at repo root:
  - `scripts/generated/deps.json`
  - `scripts/generated/msys.txt`
  - `pkg_info.sh`
  - `scripts/generated/deps-map-make.json`
  - `scripts/sh/stage1-list.sh`
  - `scripts/sh/stage2-list.sh`

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
- Update README/package references to the new TypeScript commands and
  compatibility wrappers.
- Run focused tests, type checks, Vite build, and lightweight smoke checks.
