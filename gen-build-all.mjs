import * as fs from "fs/promises";
import * as path from "path";
import { fileURLToPath } from "url";
import process from "node:process";

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

  "libtool", // In bootstrap step
  "libltdl",

  "doxygen", // ["doxygen","python"]

  "git", // ["git","libcurl-devel","rust"]
  "mingw-w64-cross-gcc",
  "mingw-w64-cross-mingwarm64-gcc",

  "cmake-bootstrap",
  "mingw-w64-cross-clang", // mingw-w64-cross-clang: /opt/i686-w64-mingw32/bin/ar exists in filesystem
  "mingw-w64-cross-clang-crt",
  "mingw-w64-cross-clang-headers",
  "msys2-runtime-3.3",
  "msys2-runtime-3.3-devel",
  "msys2-runtime-3.4",
  "msys2-runtime-3.4-devel",
  "msys2-runtime-3.5",
  "msys2-runtime-3.5-devel",
  "parallel", // parallel: /usr/bin/parallel exists in filesystem /usr/bin/parallel.exe is owned by moreutils 0.70-1
  "gnu-netcat", // gnu-netcat-0.7.1-3 and openbsd-netcat-1.234_1-1 are in conflict. Remove openbsd-netcat? [Y/n] "

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

  // gcc libreadline-devel zlib-devel autotools libxslt docbook-xsl doxygen libiconv-devel
  deps_map_make["libxml2"] = [
    "gcc",
    "libreadline-devel",
    "zlib-devel",
    "autotools",
    // 'libxslt',
    "doxygen",
    // "docbook-xsl",
    "libiconv-devel",
  ];
  deps_map_make["libxml2-devel"] = deps_map_make["libxml2"];
  deps_map_make["libxcrypt-devel"] = ["gcc", "autotools"]; // gcc autotools perl
  console.log('deps_map_make update finished')

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
    }
  }
  // dirs = dirs.slice(dirs.indexOf("libxcrypt"));
  // let dir_lines = await fs.readFile("failed_dirs.txt", "utf-8");
  // dirs = dir_lines.split("\n");
  // console.log(dirs)
  for (let new_dir of dirs) {
    script += `pushd ./ports/${new_dir}
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: ${new_dir} with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building ${new_dir} finished"
popd\n`;
  }
  // console.log(dirs)
  await fs.writeFile("build-all.sh", script);
}

main();
