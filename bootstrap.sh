mkdir -p dist
pushd dist-init
find -name "*.pkg.tar.zst" | xargs -I ARG pacman -U --overwrite \* ARG  --noconfirm
popd

rm -rf /usr/bin/cygwin1.dll
rm -rf /usr/lib/*.origin

# Building and install cmake
pushd ./ports/cmake
# updpkgsums
makepkg --cleanbuild --syncdeps --force --noconfirm
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
popd

# Building and install libtool
pushd ./ports/libtool
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
popd
pacman -U --overwrite \* ./dist/libltdl-2.5.4-5-x86_64.pkg.tar.zst --noconfirm
pacman -U --overwrite \* ./dist/libtool-2.5.4-5-x86_64.pkg.tar.zst --noconfirm
pacman -U --overwrite \* ./dist/cmake-4.2.1-2-x86_64.pkg.tar.zst --noconfirm

# Building/install binutils
pushd ./ports/binutils
makepkg --cleanbuild --syncdeps --force --noconfirm
mv -f binutils-2.45.1-2-x86_64.pkg.tar.zst ../../dist/binutils-2.45.1-2-x86_64-stage0.pkg.tar.zst
popd
pacman -U --overwrite \* ./dist/binutils-2.45.1-2-x86_64-stage0.pkg.tar.zst --noconfirm

sh bootstrap-msys2-runtime.sh
sh bootstrap-gcc.sh
