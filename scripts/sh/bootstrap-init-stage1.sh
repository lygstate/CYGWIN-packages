
echo "Install new cmake meson scons and libtool"
pacman -U --noconfirm --overwrite \* ./dist/stage1_core/libltdl-$LIBTOOL_PKGVER-$LIBTOOL_PKGREL-x86_64.pkg.tar.zst
pacman -U --noconfirm --overwrite \* ./dist/stage1_core/libtool-$LIBTOOL_PKGVER-$LIBTOOL_PKGREL-x86_64.pkg.tar.zst
pacman -U --noconfirm --overwrite \* ./dist/stage1_core/cmake-$CMAKE_PKGVER-$CMAKE_PKGREL-x86_64.pkg.tar.zst
pacman -U --noconfirm --overwrite \* ./dist/stage1_core/meson-$MESON_PKGVER-$MESON_PKGREL-any.pkg.tar.zst
pacman -U --noconfirm --overwrite \* ./dist/stage1_core/scons-$SCONS_PKGVER-$SCONS_PKGREL-any.pkg.tar.zst

echo "Install new runtime and libiconv"
rm -rf ./tmp
mkdir -p ./tmp

tar xf ./dist/stage1_core/msys2-runtime-devel-$MSYS_RUNTIME_PKGVER-$MSYS2_BOOTSTRAP_VER-x86_64.pkg.tar.zst -C ./tmp
tar xf ./dist/stage1_core/msys2-runtime-$MSYS_RUNTIME_PKGVER-$MSYS2_BOOTSTRAP_VER-x86_64.pkg.tar.zst -C ./tmp
tar xf ./dist/stage1_core/libiconv-devel-$LIBICONV_PKGVER-$LIBICONV_PKGREL-x86_64.pkg.tar.zst -C ./tmp
tar xf ./dist/stage1_core/libiconv-$LIBICONV_PKGVER-$LIBICONV_PKGREL-x86_64.pkg.tar.zst -C ./tmp

rm -rf ./dist-tmp
cp -rf ./tmp ./dist-tmp

cp -arf ./tmp/usr/bin/*.dll /usr/bin/
rm -rf ./tmp/usr/bin
cp -arf ./tmp/usr/ /
rm -rf ./tmp
echo "Install new runtime and libiconv finished"

echo "Install new gcc and binutils"
tar xf ./dist/stage1_core/binutils-$BINUTILS_PKGVER-$BINUTILS_PKGREL-x86_64.pkg.tar.zst -C /
tar xf ./dist/stage1_core/gcc-libs-$GCC_PKGVER-$GCC_PKGREL-x86_64.pkg.tar.zst -C /
tar xf ./dist/stage1_core/gcc-$GCC_PKGVER-$GCC_PKGREL-x86_64.pkg.tar.zst -C /
rm -rf /usr/lib/gcc/x86_64-pc-cygwin/$GCC_PKGVER/msys-lto_plugin.dll

echo "Install new gcc and binutils finished"
