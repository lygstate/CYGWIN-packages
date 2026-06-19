import { builtinModules } from "node:module";
import { dirname, resolve } from "node:path";
import { fileURLToPath } from "node:url";
import { defineConfig } from "vite";

const rootDir = dirname(fileURLToPath(import.meta.url));

const external = new Set([
  ...builtinModules,
  ...builtinModules.map((moduleName) => `node:${moduleName}`),
]);

export default defineConfig({
  build: {
    outDir: "dist-scripts",
    emptyOutDir: true,
    target: "node26",
    ssr: true,
    rollupOptions: {
      external: (id) => external.has(id),
      input: {
        "build-all": resolve(rootDir, "scripts/build-all.ts"),
        "build-check-bootstrap": resolve(
          rootDir,
          "scripts/build-check-bootstrap.ts",
        ),
        "build-check-deps": resolve(rootDir, "scripts/build-check-deps.ts"),
        "build-check-msys-stage": resolve(
          rootDir,
          "scripts/build-check-msys-stage.ts",
        ),
        "build-single": resolve(rootDir, "scripts/build-single.ts"),
        "build-single-stage2": resolve(
          rootDir,
          "scripts/build-single-stage2.ts",
        ),
        "build-single-sums": resolve(rootDir, "scripts/build-single-sums.ts"),
        "build-stage-hook": resolve(rootDir, "scripts/build-stage-hook.ts"),
        "build-stage0": resolve(rootDir, "scripts/build-stage0.ts"),
        "build-stage1": resolve(rootDir, "scripts/build-stage1.ts"),
        check: resolve(rootDir, "scripts/check.ts"),
        deps: resolve(rootDir, "scripts/deps.ts"),
        "gen-build-all": resolve(rootDir, "scripts/gen-build-all.ts"),
        "install-for-stage0": resolve(rootDir, "scripts/install-for-stage0.ts"),
        "install-for-stage2": resolve(rootDir, "scripts/install-for-stage2.ts"),
        "install-for-stage3": resolve(rootDir, "scripts/install-for-stage3.ts"),
        "install-mingw-for-stage3": resolve(
          rootDir,
          "scripts/install-mingw-for-stage3.ts",
        ),
        "test/utils-install-base.test": resolve(
          rootDir,
          "scripts/test/utils-install-base.test.ts",
        ),
      },
      output: {
        entryFileNames: "[name].js",
      },
    },
  },
});
