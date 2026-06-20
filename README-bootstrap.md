# Bootstraping msys-2.0.dll to cygwin1.dll

## Steps

### Config `ci_tools_base` in scripts/utils.ts properly

### Running `node scripts/install-for-stage0.ts` for generate initial stage0 msys64 properly

### Running `node scripts/deps.ts` to generate `scripts/generated/msys.txt` and `scripts/generated/deps.json`

### Running `node scripts/gen-build-all.ts` to generate stage package lists

### Building all packages

See [BUILD-START.md](BUILD-START.md) for the full quick-start guide, manual
resume steps, and `rebaseall` troubleshooting.

Open a normal Command Prompt or MSYS2-CYGWIN terminal, not the Cursor
integrated terminal, then:

```bat
start.bat
start.bat --help
start.bat --from stage2-gcc
```
