sh bootstrap-init.sh

rm -rf ./tmp
mkdir -p ./tmp

tar xf ./dist/filesystem-2025.05.08-2-x86_64.pkg.tar.zst -C ./tmp

tar xf ./dist/gmp-6.3.0-3-x86_64.pkg.tar.zst -C ./tmp
tar xf ./dist/gmp-devel-6.3.0-3-x86_64.pkg.tar.zst -C ./tmp

tar xf ./dist/isl-0.27-2-x86_64.pkg.tar.zst -C ./tmp
tar xf ./dist/isl-devel-0.27-2-x86_64.pkg.tar.zst -C ./tmp

tar xf ./dist/mpc-devel-1.3.1-2-x86_64.pkg.tar.zst -C ./tmp
tar xf ./dist/mpc-1.3.1-2-x86_64.pkg.tar.zst -C ./tmp

tar xf ./dist/mpfr-devel-4.2.2-2-x86_64.pkg.tar.zst -C ./tmp
tar xf ./dist/mpfr-4.2.2-2-x86_64.pkg.tar.zst -C ./tmp

tar xf ./dist/zlib-devel-1.3.1-2-x86_64.pkg.tar.zst -C ./tmp
tar xf ./dist/zlib-1.3.1-2-x86_64.pkg.tar.zst -C ./tmp

tar xf ./dist/gettext-0.22.5-2-x86_64.pkg.tar.zst -C ./tmp
tar xf ./dist/gettext-devel-0.22.5-2-x86_64.pkg.tar.zst -C ./tmp
tar xf ./dist/libasprintf-0.22.5-2-x86_64.pkg.tar.zst -C ./tmp
tar xf ./dist/libgettextpo-0.22.5-2-x86_64.pkg.tar.zst -C ./tmp
tar xf ./dist/libintl-0.22.5-2-x86_64.pkg.tar.zst -C ./tmp

tar xf ./dist/libiconv-devel-1.18-2-x86_64.pkg.tar.zst -C ./tmp
tar xf ./dist/libiconv-1.18-2-x86_64.pkg.tar.zst -C ./tmp

tar xf ./dist/libzstd-1.5.7-2-x86_64.pkg.tar.zst -C ./tmp
tar xf ./dist/libzstd-devel-1.5.7-2-x86_64.pkg.tar.zst -C ./tmp
tar xf ./dist/zstd-1.5.7-2-x86_64.pkg.tar.zst -C ./tmp

tar xf ./dist/libreadline-devel-8.3.003-2-x86_64.pkg.tar.zst -C ./tmp
tar xf ./dist/libreadline-8.3.003-2-x86_64.pkg.tar.zst -C ./tmp

tar xf ./dist/ncurses-devel-6.6-2-x86_64.pkg.tar.zst -C ./tmp
tar xf ./dist/ncurses-6.6-2-x86_64.pkg.tar.zst -C ./tmp

tar xf ./dist/gawk-5.3.2-2-x86_64.pkg.tar.zst -C ./tmp

tar xf ./dist/bash-devel-5.3.009-2-x86_64.pkg.tar.zst -C ./tmp
tar xf ./dist/bash-5.3.009-2-x86_64.pkg.tar.zst -C ./tmp

tar xf ./dist-init/gcc-libs-15.2.0-2-x86_64-stage0.pkg.tar.zst -C ./tmp
tar xf ./dist-init/gcc-15.2.0-2-x86_64-stage0.pkg.tar.zst -C ./tmp
tar xf ./dist/msys2-runtime-devel-3.6.5-5-x86_64.pkg.tar.zst -C ./tmp
tar xf ./dist/msys2-runtime-3.6.5-5-x86_64.pkg.tar.zst -C ./tmp

rm -rf ./dist-tmp
cp -rf ./tmp ./dist-tmp

cp -arf ./tmp/usr/bin/*.dll /usr/bin/
rm -rf ./tmp/usr/bin
cp -arf ./tmp/usr/ /
rm -rf ./tmp
echo "All installed"

tar xf ./dist-init/gcc-15.2.0-2-x86_64-stage0.pkg.tar.zst -C /
tar xf ./dist-init/binutils-2.45.1-2-x86_64-stage0.pkg.tar.zst -C /
tar xf ./dist/binutils-2.45.1-2-x86_64-stage1.pkg.tar.zst -C /
