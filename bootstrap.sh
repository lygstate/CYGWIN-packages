mkdir -p dist
pacman -U --overwrite \* ./dist-init/msys2-runtime-3.6.5-1-x86_64.pkg.tar.zst --noconfirm
pacman -U --overwrite \* ./dist-init/msys2-runtime-devel-3.6.5-1-x86_64.pkg.tar.zst --noconfirm
pacman -U --overwrite \* ./dist-init/gcc-libs-15.2.0-1-x86_64.pkg.tar.zst --noconfirm
pacman -U --overwrite \* ./dist-init/gcc-15.2.0-1-x86_64.pkg.tar.zst --noconfirm
pacman -U --overwrite \* ./dist-init/binutils-2.45.1-1-x86_64.pkg.tar.zst --noconfirm
rm -rf /usr/bin/cygwin1.dll
rm -rf /usr/lib/*.origin

# Building and install cmake
pushd ./ports/cmake
# updpkgsums
makepkg --cleanbuild --syncdeps --force --noconfirm --install 
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
popd

# Building and install libtool
pushd ./ports/libtool
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck --install 
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
popd

# Building/install binutils
pushd ./ports/binutils
makepkg --cleanbuild --syncdeps --force --noconfirm
mv -f binutils-2.45.1-2-x86_64.pkg.tar.zst ../../dist/binutils-2.45.1-2-x86_64-stage0.pkg.tar.zst
popd
pacman -U ./dist/binutils-2.45.1-2-x86_64-stage0.pkg.tar.zst --noconfirm

sh bootstrap-msys2-runtime.sh
sh bootstrap-gcc.sh
