import * as fs from "fs/promises";
import * as fsSync from "fs";
import * as path from "path";
import { fileURLToPath } from "url";
import process from "node:process";
import { black_list, spawnProcessAsyncCapture } from "./utils.mjs";

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

let need_exit = false;
process.on("SIGINT", function () {
  console.log("Caught interrupt signal");
  need_exit = true;
});

let devel_black_list = [
  "gcc-libs",
  "gcc",
  "msys2-runtime",
  "msys2-runtime-devel",
  "binutils",
  "make",
  "ninja",
  "cmake",
  "autotools",

  "doxygen", // ["doxygen","python"]

  "git", // ["git","libcurl-devel","rust"]
  "mingw-w64-cross-gcc",
  "mingw-w64-cross-mingwarm64-gcc",

  "libiconv",
  "libiconv-devel",
  "iconv",
];

function dump_deps(deps_map) {
  // console.log(deps_map);
  let keys_count = -1;

  // gettext-devel
  let packages = [];

  for (;;) {
    let keys = Object.keys(deps_map);
    if (keys.length == keys_count) {
      break;
    }
    keys_count = keys.length;
    if (keys.length == 0) {
      break;
    }
    for (let key of keys) {
      if (deps_map[key].length == 0) {
        packages.push(key);
        delete deps_map[key];
      }
    }
    keys = Object.keys(deps_map);
    for (let key of keys) {
      let items = deps_map[key];
      items = items.filter((element) => {
        let item = element.split("=")[0];
        if (Object.hasOwn(deps_map, item)) {
          return true;
        }
      });
      deps_map[key] = items;
    }
  }

  let final_keys = Object.keys(deps_map);
  console.log(`Circular map ${final_keys.length}`);
  for (let key of final_keys) {
    console.log(`${key}: ${JSON.stringify(deps_map[key])}`);
  }
  return packages;
}

async function main() {
  const deps_json_filepath = path.join(__dirname, "deps.json");
  const deps_json = JSON.parse(await fs.readFile(deps_json_filepath, "utf-8"));
  // dump_deps(deps_json.deps_map);
  const deps_map_make = {};
  const dir_for_package = {};
  for (let pkg of deps_json.pkg_info) {
    for (let pkgname of pkg.pkgname.split(" ")) {
      if (pkg.makedepends.length > 0) {
        let items = pkg.makedepends.split(" ");
        deps_map_make[pkgname] = items.filter((item) => {
          return item != pkgname;
        });
      } else {
        deps_map_make[pkgname] = deps_json.deps_map[pkgname];
      }
      dir_for_package[pkgname] = pkg.dir;
      // console.log(deps_map_make[pkgname]);
    }
  }

  for (let item of devel_black_list) {
    deps_map_make[item] = [];
  }
  deps_map_make["libxml2"] = [
    "gcc",
    "libreadline-devel",
    "zlib-devel",
    "autotools",
    //  "docbook-xsl",
    "doxygen",
    // 'libxslt',
    "libiconv-devel",
  ];
  deps_map_make["libxml2-devel"] = deps_map_make["libxml2"];
  deps_map_make["libxcrypt-devel"] = ["gcc", "autotools"];
  console.log("cargo-edit:" + deps_map_make["cargo-edit"]);

  let packages = dump_deps(deps_map_make);
  packages = packages.filter((x) => devel_black_list.indexOf(x) < 0);
  // console.log(JSON.stringify(packages))
  let dirs = [];
  let dir_set = new Set();
  let script = "";
  for (let pkg of packages) {
    let new_dir = dir_for_package[pkg];
    if (!dir_set.has(new_dir)) {
      dirs.push(new_dir);
      dir_set.add(new_dir);
      script += `pushd ./ports/${new_dir}
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
find  -name "*.pkg.tar.zst"  | xargs -I ARG tar xf ARG -C /
mv -f *.pkg.tar.zst ../../dist/
popd\n`;
    }
  }
  // console.log(dirs)
  await fs.writeFile("build-all.sh", script);
}

main();
