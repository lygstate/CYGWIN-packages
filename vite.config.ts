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
        deps: resolve(rootDir, "scripts/deps.ts"),
        "gen-build-all": resolve(rootDir, "scripts/gen-build-all.ts"),
        "install-stages": resolve(rootDir, "scripts/install-stages.ts"),
        "test/utils-install-base.test": resolve(
          rootDir,
          "test/utils-install-base.test.ts",
        ),
      },
      output: {
        entryFileNames: "[name].js",
      },
    },
  },
});
