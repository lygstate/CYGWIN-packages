pacman -U  ./dist/binutils-2.45.1-2-x86_64-stage0.pkg.tar.zst --noconfirm

tar xf ./dist/gcc-libs-15.2.0-2-x86_64-stage0.pkg.tar.zst  -C /
tar xf ./dist/gcc-15.2.0-2-x86_64-stage0.pkg.tar.zst -C /

tar xf ./dist/msys2-runtime-devel-3.6.5.2-1-x86_64.pkg.tar.zst  -C /
tar xf ./dist/msys2-runtime-3.6.5.2-1-x86_64.pkg.tar.zst  -C /

tar xf ./dist/libtool-2.5.4-5-x86_64.pkg.tar.zst -C /

tar xf ./dist/libiconv-devel-1.18-2-x86_64.pkg.tar.zst -C /
tar xf ./dist/libiconv-1.18-2-x86_64.pkg.tar.zst -C /

echo "All installed"
