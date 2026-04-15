# Bootstraping msys-2.0.dll to cygwin1.dll

## Steps

### Config `ci_tools_msys64_parent_basic` in utils.mjs properly

### Running `install-for-stage0.mjs` for generate initial stage0 msys64 properly

### Running `deps.mjs` to generate deps.json

### Running `gen-build-all.mjs` to generate `build-stage1-list.sh` and `build-stage2-list.sh`

### Building all packages

Open MSYS2-CYGWIN-CMD, then:

```bat
build-all.bat
```
