# Bootstrap Build Quick Start

This repo has one full-build entrypoint: [start.bat](start.bat), which runs
`node scripts/build-all.ts`.

Use `start.bat --from <step>` to resume from any pipeline step. Run
`start.bat --help` for the step list.

## Before the first build

1. Set `CI_TOOLS_ROOT` if your CI tools are not under `D:\CI-Tools`.

   ```bat
   set CI_TOOLS_ROOT=D:\CI-Tools
   ```

2. Install Node tooling once:

   ```bat
   yarn install
   ```

3. Check `ci_tools_base` in [scripts/utils.ts](scripts/utils.ts).

4. Run the bootstrap (dependency data and stage lists are generated
   automatically after `stage1-install-prep`):

   ```bat
   start.bat
   ```

   The pipeline runs `deps.ts` and `gen-build-all.ts` in the `stage1-deps` and
   `stage1-gen-lists` steps immediately after stage1 install prep. Manual re-run
   when ports change:

   ```bat
   node scripts/deps.ts
   node scripts/gen-build-all.ts
   ```

   Generated outputs:

   - `scripts/generated/msys.txt` (from stage1 install prep)
   - `scripts/generated/deps.json`
   - `scripts/generated/deps-map-make.json`
   - `scripts/generated/stage1-list.txt`
   - `scripts/generated/stage2-list.txt`

## Run the full bootstrap

Use a normal Windows Command Prompt or the project's MSYS2/Cygwin terminal.
Do **not** run the full bootstrap from the Cursor or VS Code integrated
terminal.

The old batch launcher had an explicit warning about this: IDE terminals can
put the wrong `bash`/`dash` on `PATH` and break `rebaseall -p`.

From the repo root:

```bat
cd /d D:\work\xemu\CYGWIN-packages
set CI_TOOLS_ROOT=D:\CI-Tools
start.bat
start.bat --help
start.bat --from 6
start.bat --from stage2-gcc
```

Logs are written under `scripts/logs/` (one file per pipeline step id):

- `scripts/logs/stage1-install-prep.txt`
- `scripts/logs/stage1-deps.txt`
- `scripts/logs/stage1-gen-lists.txt`
- `scripts/logs/stage1-extract.txt`
- `scripts/logs/stage1-rt-origin-build.txt`
- `scripts/logs/stage1-rt-origin-install.txt`
- `scripts/logs/stage1-rt-hook-build.txt`
- `scripts/logs/stage1-rt-hook-install.txt`
- `scripts/logs/stage1-core-build.txt`
- `scripts/logs/stage1-init.txt`
- `scripts/logs/stage1-list.txt`
- `scripts/logs/stage2-install-prep.txt`
- `scripts/logs/stage2-gcc.txt`
- `scripts/logs/stage2-rust-cross.txt`
- `scripts/logs/stage2-rebaseall-before-rust.txt`
- `scripts/logs/stage2-rust-native.txt`
- `scripts/logs/stage2-rebaseall-after-rust.txt`
- `scripts/logs/stage2-cargo.txt`
- `scripts/logs/stage2-list.txt`
- `scripts/logs/stage3-install-prep.txt`
- `scripts/logs/stage3-extract.txt`
- `scripts/logs/stage3-mingw-install.txt`

## What `start.bat` runs

Order of operations:

1. `stage1-install-prep` -- install MSYS packages into `msys64-stage1`
2. `stage1-deps` and `stage1-gen-lists` -- `deps.ts` and `gen-build-all.ts`
3. `stage1-extract` -- extract `msys64-stage1` from archive
4. Stage1 runtime builds (`stage1-rt-origin-build`, `stage1-rt-origin-install`,
   `stage1-rt-hook-build`, `stage1-rt-hook-install`, `stage1-core-build`), then
   `stage1-init` and `stage1-list`
5. `stage2-install-prep` -- install stage1-built packages into `msys64-stage2`
6. Build stage2 `gcc`, `rust` cross, `rebaseall -p`, `rust` native, `rebaseall -p`, `cargo-c`
7. `stage2-list` -- build packages from `scripts/generated/stage2-list.txt`
   (`gcc` is built only in step 6; `rust` and `cargo-c` appear in the list
   for a second pass after the dedicated cross/native/cargo steps)
8. `stage3-install-prep`, then `stage3-extract` and `stage3-mingw-install`

Packages in `packages_build_only` (for example `uutils-coreutils`) are built
from the list but not installed into the live msys64 or stage prep trees.

## Resume with `--from`

```bat
start.bat --from stage1-install-prep
start.bat --from stage1-deps
start.bat --from stage2-install-prep
start.bat --from stage2-gcc
start.bat --from stage2-rust-native
start.bat --from stage2-list
start.bat --from stage3-install-prep
start.bat --from stage3-mingw-install
```

Group numbers also work and start at the first step in that group:

```bat
start.bat --from 4
start.bat --from 6
start.bat --from 9
```

Run `start.bat --help` for the full step list.

## Manual resume points

Use these only if you need to run one command outside `start.bat`.

### Stage1 install prep only

```bat
start.bat --from stage1-install-prep
```

### Stage1 generate only (deps + stage lists)

Requires `stage1-install-prep` to have finished.

```bat
start.bat --from stage1-deps
```

Or manually:

```bat
node scripts/deps.ts
node scripts/gen-build-all.ts
```

### Stage1 extract only

```bat
start.bat --from stage1-extract
```

Or extract from `%CI_TOOLS_ROOT%\msys64-stage1` with `delete-msys64.bat` and
`extract.bat`.

### Stage1 init and package list

First run (group 5, both steps):

```bat
start.bat --from 5
```

Or individually:

```bat
start.bat --from stage1-init
start.bat --from stage1-list
```

Logs: `scripts/logs/stage1-init.txt`, `scripts/logs/stage1-list.txt`

### Stage2 prep only

```bat
start.bat --from stage2-install-prep
```

Check `scripts/logs/stage2-install-prep.txt` for pacman errors before continuing.

### Stage2 gcc / rust / cargo only

Use stage2 bash:

```bat
set MSYS=winsymlinks:native
set MSYSTEM=CYGWIN
set CHERE_INVOKING=1
set MSYS_BASH=%CI_TOOLS_ROOT%\msys64-stage2\msys64\usr\bin\bash.exe
set MSYS_DASH=%CI_TOOLS_ROOT%\msys64-stage2\msys64\usr\bin\dash.exe
```

Gcc:

```bat
"%MSYS_BASH%" --login -c "export MSYS_BOOTSTRAP_STAGE=stage2; source scripts/sh/check-bootstrap.sh; sh scripts/sh/single.sh gcc >scripts/logs/build-stage2-gcc.txt 2>&1"
```

Rust cross:

```bat
"%MSYS_BASH%" --login -c "export MSYS_BOOTSTRAP_RUST=enabled; export MSYS_BOOTSTRAP_DISABLE_COPY_PACKAGES=enabled; export MSYS_BOOTSTRAP_PACKAGE_NAME_SUFFIX=cross; export MSYS_BOOTSTRAP_STAGE=stage2; source scripts/sh/check-bootstrap.sh; sh scripts/sh/single.sh rust >scripts/logs/build-stage2-rust-cross.txt 2>&1"
```

Rebaseall:

```bat
set MSYS=
set MSYSTEM=
set CHERE_INVOKING=
"%MSYS_BASH%" --login -c "rm -rf /etc/rebase.db.x86_64"
"%MSYS_DASH%" /usr/bin/rebaseall -p -b 0x400000000
"%MSYS_BASH%" --login -c "rm -rf /etc/rebase.db.x86_64"
```

Rust native:

```bat
"%MSYS_BASH%" --login -c "export MSYS_BOOTSTRAP_STAGE=stage2; source scripts/sh/check-bootstrap.sh; sh scripts/sh/single.sh rust >scripts/logs/build-stage2-rust-native.txt 2>&1"
```

Run rebaseall again, then build `cargo-c`.

### Stage2 package lists

```bat
start.bat --from stage2-list
```

Log: `scripts/logs/stage2-list.txt`

### Stage3 prep only

```bat
start.bat --from stage3-install-prep
```

### Stage3 mingw only (extract archive + install mingw)

Requires `stage3-install-prep` to have finished (creates `extract.bat` under
`%CI_TOOLS_ROOT%\msys64-stage3`).

```bat
start.bat --from stage3-mingw-install
```

## Why `rebaseall -p` failed

### `Invalid Baseaddress 0x70000000, must be > 0x200000000`

Root cause:

- `rebaseall` clears `MSYSTEM` so it scans all of `/usr/bin` and `/usr/lib`.
- With `MSYSTEM` cleared, `uname -s` is `MINGW64_NT-...`, so the default base
  stays at legacy `0x70000000`.
- Current 64-bit `rebase` rejects that base.

Fix: pass `-b 0x400000000` explicitly (see manual rebase steps below).

### `Too many DLLs for available address space`

Root cause:

- Keeping `MSYSTEM=CYGWIN` makes `rebaseall` use the Cygwin package-list path.
  This bootstrap tree has no `/etc/setup`, so only a small addon-DLL list is
  rebased while `/etc/rebase.db.x86_64` still tracks the full tree from an
  earlier mingw-path run.
- Database-mode rebase then runs out of address space.

Fix:

- Clear `MSYSTEM` for the full `/usr/bin` + `/usr/lib` scan.
- Pass `-b 0x400000000`.
- Remove `/etc/rebase.db.x86_64` before and after `rebaseall -p`.

Other things that can still break rebase:

1. **Stage2 tree unhealthy** - pacman `dofork` errors during `stage2-install-prep`
   mean the Cygwin layer may already be broken.
2. **IDE terminal PATH** - prefer a plain Command Prompt, but the errors above
   are not caused by Cursor being on `PATH`.

## Rebaseall recovery steps

1. Close other MSYS/Cygwin/Git-Bash terminals and IDE terminals using MSYS.
2. Open a normal Command Prompt, not Cursor integrated terminal.
3. Make sure only stage2 MSYS tools are first on `PATH`:

   ```bat
   set CI_TOOLS_ROOT=D:\CI-Tools
   set PATH=%CI_TOOLS_ROOT%\msys64-stage2;%CI_TOOLS_ROOT%\msys64-stage2\msys64\usr\bin;%PATH%
   ```

4. Retry rebaseall with the stage2 rebase recipe:

   ```bat
   set MSYS=
   set MSYSTEM=
   set CHERE_INVOKING=
   "%CI_TOOLS_ROOT%\msys64-stage2\msys64\usr\bin\bash.exe" --login -c "rm -rf /etc/rebase.db.x86_64"
   "%CI_TOOLS_ROOT%\msys64-stage2\msys64\usr\bin\dash.exe" /usr/bin/rebaseall -p -b 0x400000000
   "%CI_TOOLS_ROOT%\msys64-stage2\msys64\usr\bin\bash.exe" --login -c "rm -rf /etc/rebase.db.x86_64"
   ```

5. If pacman still reports `dofork` errors, rebuild stage2 from prep instead
   of continuing in the broken tree:

   ```bat
   start.bat --from stage2-install-prep
   ```

6. If rebase still fails, inspect which DLL still has the old base:

   ```bat
   "%CI_TOOLS_ROOT%\msys64-stage2\msys64\usr\bin\bash.exe" --login -c "rebase -i /usr/bin/*.dll"
   ```

   Look for entries still using `0x70000000` and rebase them above
   `0x200000000`.

## Related docs

- [README-bootstrap.md](README-bootstrap.md) - high-level bootstrap overview
- [BUILD.md](BUILD.md) - manual `makepkg` notes
