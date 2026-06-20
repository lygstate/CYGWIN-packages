import * as fs from "fs/promises";
import * as path from "path";
import {
  ci_tools_msys64_stage0,
  ci_tools_msys64_stage2,
  ci_tools_msys64_stage3,
  EXTRACT_MINGW_BAT_FILENAME,
  GENERATED_MINGW_STAGE3_PACKAGES_TXT,
  MSYS64_DIR_NAME,
} from "./build-config.ts";
import {
  archiveFull,
  executePacmanInstall,
  installMsys2AllPackages,
  installMsys2BasePackages,
  installMsys2StageBatchScripts,
  writeExtractBat,
} from "./msys2-installer.ts";
import {
  dedupeDistPackageDir,
  getYYYYMMDD,
  type LoggedStep,
  repoRoot,
} from "./utils.ts";

export async function installStage0(step: LoggedStep) {
  const msys_root = path.join(ci_tools_msys64_stage0, MSYS64_DIR_NAME);
  const pkg_root = repoRoot;

  const has_msys64 = await installMsys2AllPackages(
    ci_tools_msys64_stage0,
    pkg_root,
    true,
    step,
  );

  const msys2_base_filename = await archiveFull(
    ci_tools_msys64_stage0,
    msys_root,
    "",
    step,
  );
  console.log(
    `===stage0: Archive finished as: ${msys2_base_filename} with has_msys64:${has_msys64}`,
  );
  await installMsys2StageBatchScripts(
    ci_tools_msys64_stage0,
    msys2_base_filename,
  );
  console.log(`===stage0: Wrote extract.bat and delete-msys64.bat`);
}

export async function installStage2(step: LoggedStep) {
  const msys_root = path.join(ci_tools_msys64_stage2, MSYS64_DIR_NAME);
  const pkg_root = repoRoot;
  const stage1_dist = path.join(pkg_root, "dist", "stage1");

  const has_msys64 = await installMsys2BasePackages(
    ci_tools_msys64_stage2,
    true,
    step,
  );

  const removed = await dedupeDistPackageDir(stage1_dist);
  console.log(
    `===Removed ${removed.length} duplicate package(s) from dist/stage1`,
  );

  const install_commands = [
    "pacman -U --noconfirm --overwrite \\* `ls | tr '\n' ' '`",
    "pacman -U --noconfirm --overwrite \\* `ls | tr '\n' ' '`",
    "pacman -S --needed --noconfirm --overwrite \\* mingw-w64-x86_64-python mingw-w64-x86_64-llvm mingw-w64-x86_64-clang",
  ];
  for (let i = 0; i < install_commands.length; i += 1) {
    console.log(`===Execute: "${install_commands[i]}"`);
    await executePacmanInstall(
      msys_root,
      install_commands[i],
      stage1_dist,
      false,
      step,
    );
  }
  console.log("===Switch to cygwin finished");
  const msys2_base_filename = await archiveFull(
    ci_tools_msys64_stage2,
    msys_root,
    "",
    step,
  );
  console.log(
    `===stage2: Archive finished as: ${msys2_base_filename} with has_msys64:${has_msys64}`,
  );
  await installMsys2StageBatchScripts(
    ci_tools_msys64_stage2,
    msys2_base_filename,
  );
  console.log(`===stage2: Wrote extract.bat and delete-msys64.bat`);
}

export async function installStage3(step: LoggedStep) {
  const msys_root = path.join(ci_tools_msys64_stage3, MSYS64_DIR_NAME);
  const pkg_root = repoRoot;
  const stage1_dist = path.join(pkg_root, "dist", "stage1");
  const stage2_dist = path.join(pkg_root, "dist", "stage2");

  const has_msys64 = await installMsys2BasePackages(
    ci_tools_msys64_stage3,
    true,
    step,
  );

  const removed_stage1 = await dedupeDistPackageDir(stage1_dist);
  console.log(
    `===Removed ${removed_stage1.length} duplicate package(s) from dist/stage1`,
  );
  const removed_stage2 = await dedupeDistPackageDir(stage2_dist);
  console.log(
    `===Removed ${removed_stage2.length} duplicate package(s) from dist/stage2`,
  );

  const install_commands = [
    "pacman -U --noconfirm --overwrite \\* `ls | tr '\n' ' '`",
    "pacman -U --noconfirm --overwrite \\* `ls | tr '\n' ' '`",
  ];
  for (let i = 0; i < install_commands.length; i += 1) {
    await executePacmanInstall(
      msys_root,
      install_commands[i],
      stage1_dist,
      false,
      step,
    );
  }
  await executePacmanInstall(
    msys_root,
    "pacman -U --noconfirm --overwrite \\* `ls | tr '\n' ' '`",
    stage2_dist,
    false,
    step,
  );
  console.log("===stage3: Switch to cygwin finished");
  const msys2_base_filename = await archiveFull(
    ci_tools_msys64_stage3,
    msys_root,
    "",
    step,
  );
  console.log(
    `===stage3: Archive finished as: ${msys2_base_filename} with has_msys64:${has_msys64}`,
  );
  await installMsys2StageBatchScripts(
    ci_tools_msys64_stage3,
    msys2_base_filename,
  );
  console.log(`===stage3: Wrote extract.bat and delete-msys64.bat`);
}

export async function installMingwStage3(step: LoggedStep) {
  const MINGW_PACKAGE_PREFIX = "mingw-w64-x86_64";
  const packages_extra = [
    `${MINGW_PACKAGE_PREFIX}-cmake`,
    `${MINGW_PACKAGE_PREFIX}-gdb`,
    `${MINGW_PACKAGE_PREFIX}-gdb-multiarch`,
    `${MINGW_PACKAGE_PREFIX}-libuv`,
    `${MINGW_PACKAGE_PREFIX}-spirv-tools`,
    `${MINGW_PACKAGE_PREFIX}-lld`,
    `${MINGW_PACKAGE_PREFIX}-mosquitto`,
  ];
  const packages_gegl = [
    `${MINGW_PACKAGE_PREFIX}-asciidoc`,
    `${MINGW_PACKAGE_PREFIX}-cc`,
    `${MINGW_PACKAGE_PREFIX}-gobject-introspection`,
    `${MINGW_PACKAGE_PREFIX}-gtk-doc`,
    `${MINGW_PACKAGE_PREFIX}-luajit`,
    `${MINGW_PACKAGE_PREFIX}-pkgconf`,
    `${MINGW_PACKAGE_PREFIX}-ruby`,
    `${MINGW_PACKAGE_PREFIX}-vala`,
    `${MINGW_PACKAGE_PREFIX}-meson`,
    `${MINGW_PACKAGE_PREFIX}-cairo`,
    `${MINGW_PACKAGE_PREFIX}-ffmpeg`,
    `${MINGW_PACKAGE_PREFIX}-gcc-libs`,
    `${MINGW_PACKAGE_PREFIX}-gdk-pixbuf2`,
    `${MINGW_PACKAGE_PREFIX}-gettext`,
    `${MINGW_PACKAGE_PREFIX}-glib2`,
    `${MINGW_PACKAGE_PREFIX}-jasper`,
    `${MINGW_PACKAGE_PREFIX}-json-glib`,
    `${MINGW_PACKAGE_PREFIX}-libjpeg`,
    `${MINGW_PACKAGE_PREFIX}-libpng`,
    `${MINGW_PACKAGE_PREFIX}-libraw`,
    `${MINGW_PACKAGE_PREFIX}-librsvg`,
    `${MINGW_PACKAGE_PREFIX}-libspiro`,
    `${MINGW_PACKAGE_PREFIX}-libwebp`,
    `${MINGW_PACKAGE_PREFIX}-lcms2`,
    `${MINGW_PACKAGE_PREFIX}-lensfun`,
    `${MINGW_PACKAGE_PREFIX}-maxflow`,
    `${MINGW_PACKAGE_PREFIX}-openexr`,
    `${MINGW_PACKAGE_PREFIX}-pango`,
    `${MINGW_PACKAGE_PREFIX}-SDL2`,
    `${MINGW_PACKAGE_PREFIX}-suitesparse`,
  ];
  const packages_mesa = [
    `${MINGW_PACKAGE_PREFIX}-cc`,
    `${MINGW_PACKAGE_PREFIX}-glslang`,
    `${MINGW_PACKAGE_PREFIX}-python-mako`,
    `${MINGW_PACKAGE_PREFIX}-python-pip`,
    `${MINGW_PACKAGE_PREFIX}-meson`,
    `${MINGW_PACKAGE_PREFIX}-pkgconf`,
    `${MINGW_PACKAGE_PREFIX}-libelf`,
    `${MINGW_PACKAGE_PREFIX}-llvm`,
    `${MINGW_PACKAGE_PREFIX}-clang`,
    `${MINGW_PACKAGE_PREFIX}-libclc`,
    `${MINGW_PACKAGE_PREFIX}-libva`,
    `${MINGW_PACKAGE_PREFIX}-spirv-tools`,
    `${MINGW_PACKAGE_PREFIX}-spirv-llvm-translator`,
    `${MINGW_PACKAGE_PREFIX}-vulkan-loader`,
    `${MINGW_PACKAGE_PREFIX}-zlib`,
    `${MINGW_PACKAGE_PREFIX}-zstd`,
    `${MINGW_PACKAGE_PREFIX}-opengl-man-pages`,
    `${MINGW_PACKAGE_PREFIX}-vulkan-validation-layers`,
  ];
  const packages_tss = [
    `${MINGW_PACKAGE_PREFIX}-toolchain`,
    `${MINGW_PACKAGE_PREFIX}-pkgconf`,
    `${MINGW_PACKAGE_PREFIX}-gdb`,
    `${MINGW_PACKAGE_PREFIX}-gdb-multiarch`,
    `${MINGW_PACKAGE_PREFIX}-mosquitto`,
    `${MINGW_PACKAGE_PREFIX}-clang`,
    `${MINGW_PACKAGE_PREFIX}-lld`,
  ];
  const packages_scade = [
    `${MINGW_PACKAGE_PREFIX}-toolchain`,
    `${MINGW_PACKAGE_PREFIX}-pkgconf`,
    `${MINGW_PACKAGE_PREFIX}-gdb`,
    `${MINGW_PACKAGE_PREFIX}-gdb-multiarch`,
    `${MINGW_PACKAGE_PREFIX}-clang`,
    `${MINGW_PACKAGE_PREFIX}-lld`,
    `${MINGW_PACKAGE_PREFIX}-mesa`,
    `${MINGW_PACKAGE_PREFIX}-mosquitto`,
  ];
  const packages_qemu = [
    `${MINGW_PACKAGE_PREFIX}-binutils`,
    `${MINGW_PACKAGE_PREFIX}-capstone`,
    `${MINGW_PACKAGE_PREFIX}-ccache`,
    `${MINGW_PACKAGE_PREFIX}-cjson`,
    `${MINGW_PACKAGE_PREFIX}-curl`,
    `${MINGW_PACKAGE_PREFIX}-cyrus-sasl`,
    `${MINGW_PACKAGE_PREFIX}-dtc`,
    `${MINGW_PACKAGE_PREFIX}-gcc`,
    `${MINGW_PACKAGE_PREFIX}-glib2`,
    `${MINGW_PACKAGE_PREFIX}-gnutls`,
    `${MINGW_PACKAGE_PREFIX}-gtk3`,
    `${MINGW_PACKAGE_PREFIX}-jemalloc`,
    `${MINGW_PACKAGE_PREFIX}-libcbor`,
    `${MINGW_PACKAGE_PREFIX}-libgcrypt`,
    `${MINGW_PACKAGE_PREFIX}-libjpeg-turbo`,
    `${MINGW_PACKAGE_PREFIX}-libnfs`,
    `${MINGW_PACKAGE_PREFIX}-libpng`,
    `${MINGW_PACKAGE_PREFIX}-libslirp`,
    `${MINGW_PACKAGE_PREFIX}-libssh`,
    `${MINGW_PACKAGE_PREFIX}-libtasn1`,
    `${MINGW_PACKAGE_PREFIX}-libusb`,
    `${MINGW_PACKAGE_PREFIX}-libxml2`,
    `${MINGW_PACKAGE_PREFIX}-lzo2`,
    `${MINGW_PACKAGE_PREFIX}-nettle`,
    `${MINGW_PACKAGE_PREFIX}-ninja`,
    `${MINGW_PACKAGE_PREFIX}-pixman`,
    `${MINGW_PACKAGE_PREFIX}-pkgconf`,
    `${MINGW_PACKAGE_PREFIX}-python-sphinx`,
    `${MINGW_PACKAGE_PREFIX}-python`,
    `${MINGW_PACKAGE_PREFIX}-SDL2_image`,
    `${MINGW_PACKAGE_PREFIX}-SDL2`,
    `${MINGW_PACKAGE_PREFIX}-snappy`,
    `${MINGW_PACKAGE_PREFIX}-spice-gtk`,
    `${MINGW_PACKAGE_PREFIX}-spice`,
    `${MINGW_PACKAGE_PREFIX}-toolchain`,
    `${MINGW_PACKAGE_PREFIX}-usbredir`,
    `${MINGW_PACKAGE_PREFIX}-zstd`,
  ];

  const packages = Array.from(
    new Set(
      [].concat(
        packages_extra,
        packages_gegl,
        packages_mesa,
        packages_tss,
        packages_scade,
        packages_qemu,
      ),
    ),
  );

  const ci_tools_msys64_parent = ci_tools_msys64_stage3;
  const msys_root = path.join(ci_tools_msys64_parent, MSYS64_DIR_NAME);
  const pkg_root = repoRoot;

  const msys_txt_path = path.join(pkg_root, GENERATED_MINGW_STAGE3_PACKAGES_TXT);
  await fs.mkdir(path.dirname(msys_txt_path), { recursive: true });
  await fs.writeFile(msys_txt_path, packages.join("\n"), "utf-8");

  await executePacmanInstall(
    msys_root,
    `pacman -S --noconfirm --needed $(cat ${GENERATED_MINGW_STAGE3_PACKAGES_TXT})`,
    pkg_root,
    false,
    step,
  );
  console.log("===stage3: Install mingw packages finished");
  const msys2_base_filename = await archiveFull(
    ci_tools_msys64_parent,
    msys_root,
    `msys2-mingw-x86_64-${getYYYYMMDD(new Date())}-full.tar`,
    step,
  );
  await writeExtractBat(
    ci_tools_msys64_parent,
    msys2_base_filename,
    EXTRACT_MINGW_BAT_FILENAME,
  );

  console.log(
    `===stage3: Archive finished as: ${msys2_base_filename} for mingw64`,
  );
}
