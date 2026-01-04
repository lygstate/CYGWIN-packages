mkdir -p dist
pacman -U --overwrite \* ./dist-init/msys2-runtime-3.6.5-1-x86_64.pkg.tar.zst --noconfirm
pacman -U --overwrite \* ./dist-init/msys2-runtime-devel-3.6.5-1-x86_64.pkg.tar.zst --noconfirm
pacman -U --overwrite \* ./dist-init/gcc-libs-15.2.0-1-x86_64.pkg.tar.zst --noconfirm
pacman -U --overwrite \* ./dist-init/gcc-15.2.0-1-x86_64.pkg.tar.zst --noconfirm
rm -rf /usr/bin/cygwin1.dll

# Building cmake
pushd ./ports/cmake
# updpkgsums
makepkg --cleanbuild --syncdeps --force --noconfirm --install 
popd

# Building/install binutils and gcc first
pushd ./ports/binutils
makepkg --cleanbuild --syncdeps --force --noconfirm
mv -f binutils-2.45.1-2-x86_64.pkg.tar.zst ../../dist/binutils-2.45.1-2-x86_64-stage0.pkg.tar.zst
popd

pushd ./ports/gcc
# updpkgsums
makepkg --cleanbuild --syncdeps --force --noconfirm
mv -f gcc-libs-15.2.0-2-x86_64.pkg.tar.zst ../../dist/gcc-libs-15.2.0-2-x86_64-stage0.pkg.tar.zst
mv -f gcc-15.2.0-2-x86_64.pkg.tar.zst ../../dist/gcc-15.2.0-2-x86_64-stage0.pkg.tar.zst
popd

sh bootstrap-msys2-runtime.sh
