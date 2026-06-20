# Bootstraping msys-2.0.dll to cygwin1.dll

## Steps

### Config `ci_tools_base` in scripts/utils.ts properly

### Run the full pipeline

`start.bat` installs stage0 MSYS packages, then runs `deps.ts` and
`gen-build-all.ts` to refresh `scripts/generated/deps.json` and the stage
package lists before stage1.

See [BUILD-START.md](BUILD-START.md) for the full quick-start guide, manual
resume steps, and `rebaseall` troubleshooting.

Open a normal Command Prompt or MSYS2-CYGWIN terminal, not the Cursor
integrated terminal, then:

```bat
start.bat
start.bat --help
start.bat --from stage2-gcc
```

Re-run dependency generation manually after port changes:

```bat
node scripts/deps.ts
node scripts/gen-build-all.ts
```
