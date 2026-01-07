# pacman -U --overwrite \* ./dist/cmake-4.2.1-2-x86_64.pkg.tar.zst --noconfirm
# pacman -U --overwrite \* ./dist/libltdl-2.5.4-5-x86_64.pkg.tar.zst --noconfirm
# pacman -U --overwrite \* ./dist/libtool-2.5.4-5-x86_64.pkg.tar.zst --noconfirm
# pacman -U --overwrite \* ./dist/binutils-2.45.1-2-x86_64-stage0.pkg.tar.zst --noconfirm

rm -rf tmp
mkdir -p tmp

tar xf ./dist/msys2-runtime-devel-3.6.5.5-1-x86_64.pkg.tar.zst -C ./tmp
tar xf ./dist/msys2-runtime-3.6.5.5-1-x86_64.pkg.tar.zst -C ./tmp
rm -rf /usr/lib/*.origin

tar xf ./dist/libiconv-devel-1.18-2-x86_64.pkg.tar.zst -C ./tmp
tar xf ./dist/libiconv-1.18-2-x86_64.pkg.tar.zst -C ./tmp
tar xf ./dist/iconv-1.18-2-x86_64.pkg.tar.zst -C ./tmp

tar xf ./dist/libintl-0.22.5-2-x86_64.pkg.tar.zst -C ./tmp
tar xf ./dist/libasprintf-0.22.5-2-x86_64.pkg.tar.zst -C ./tmp
tar xf ./dist/libgettextpo-0.22.5-2-x86_64.pkg.tar.zst -C ./tmp
tar xf ./dist/gettext-devel-0.22.5-2-x86_64.pkg.tar.zst -C ./tmp

tar xf ./dist/zlib-1.3.1-2-x86_64.pkg.tar.zst -C ./tmp
tar xf ./dist/zlib-devel-1.3.1-2-x86_64.pkg.tar.zst -C ./tmp

tar xf ./dist/mpfr-4.2.2-2-x86_64.pkg.tar.zst -C ./tmp
tar xf ./dist/mpfr-devel-4.2.2-2-x86_64.pkg.tar.zst -C ./tmp

tar xf ./dist/mpc-1.3.1-2-x86_64.pkg.tar.zst -C ./tmp
tar xf ./dist/mpc-devel-1.3.1-2-x86_64.pkg.tar.zst -C ./tmp

tar xf ./dist/isl-0.27-2-x86_64.pkg.tar.zst -C ./tmp
tar xf ./dist/isl-devel-0.27-2-x86_64.pkg.tar.zst -C ./tmp

tar xf ./dist/gmp-6.3.0-3-x86_64.pkg.tar.zst -C ./tmp
tar xf ./dist/gmp-devel-6.3.0-3-x86_64.pkg.tar.zst -C ./tmp
# rm -rf ./tmp/usr/lib/
cp -arf ./tmp/usr/ /
echo "All installed"
