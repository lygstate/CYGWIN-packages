
pushd ./ports/msys2-runtime
# updpkgsums
makepkg --cleanbuild --syncdeps --force --noconfirm
mv -f msys2-runtime-devel-3.6.5.1-1-x86_64.pkg.tar.zst ../../dist/msys2-runtime-devel-3.6.5.1-1-x86_64-stage0.pkg.tar.zst
mv -f msys2-runtime-3.6.5.1-1-x86_64.pkg.tar.zst ../../dist/msys2-runtime-3.6.5.1-1-x86_64-stage0.pkg.tar.zst

pacman -U  ../../dist/binutils-2.45.1-2-x86_64-stage0.pkg.tar.zst --noconfirm

tar xf ../../dist/gcc-libs-15.2.0-2-x86_64-stage0.pkg.tar.zst  -C /
tar xf ../../dist/gcc-15.2.0-2-x86_64-stage0.pkg.tar.zst -C /
tar xf ../../dist/msys2-runtime-devel-3.6.5.1-1-x86_64-stage0.pkg.tar.zst  -C /
tar xf ../../dist/msys2-runtime-3.6.5.1-1-x86_64-stage0.pkg.tar.zst  -C /

makepkg --cleanbuild --syncdeps --force --noconfirm
mv -f msys2-runtime-devel-3.6.5.1-1-x86_64.pkg.tar.zst ../../dist/
mv -f msys2-runtime-3.6.5.1-1-x86_64.pkg.tar.zst ../../dist/
tar xf ../../dist/msys2-runtime-devel-3.6.5.1-1-x86_64.pkg.tar.zst  -C /
tar xf ../../dist/msys2-runtime-3.6.5.1-1-x86_64.pkg.tar.zst  -C /

popd

pushd ./ports/libtool
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
mv -f *.pkg.tar.zst ../../dist/
popd
tar xf ./dist/libtool-2.5.4-5-x86_64.pkg.tar.zst -C /

pushd ./ports/libiconv
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
mv -f *.pkg.tar.zst ../../dist/
popd

tar xf ./dist/libiconv-devel-1.18-2-x86_64.pkg.tar.zst -C /
tar xf ./dist/libiconv-1.18-2-x86_64.pkg.tar.zst -C /
