# Bootstraping msys-2.0.dll to cygwin1.dll

## Steps

### Config `ci_tools_base` in scripts/utils.ts properly

### Running `node scripts/install-for-stage0.ts` for generate initial stage0 msys64 properly

### Running `node scripts/deps.ts` to generate deps.json

### Running `node scripts/gen-build-all.ts` to generate `build-stage1-list.sh` and `build-stage2-list.sh`

### Building all packages

Open MSYS2-CYGWIN-CMD, then:

```bat
build-all.bat
```
