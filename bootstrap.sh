mkdir -p dist
pushd dist-init
find -name "*.pkg.tar.zst" | xargs -I ARG pacman -U --overwrite \* ARG  --noconfirm
popd

rm -rf /usr/bin/cygwin1.dll
rm -rf /usr/lib/*.origin

sh bootstrap-msys2-runtime.sh

# sh bootstrap-msys2-prepare.sh

# Install cmake and libtool
pacman -U --overwrite \* ./dist/libltdl-2.5.4-5-x86_64.pkg.tar.zst --noconfirm
pacman -U --overwrite \* ./dist/libtool-2.5.4-5-x86_64.pkg.tar.zst --noconfirm
pacman -U --overwrite \* ./dist/cmake-4.2.1-2-x86_64.pkg.tar.zst --noconfirm

# Install binutils
pacman -U --overwrite \* ./dist/binutils-2.45.1-2-x86_64-stage0.pkg.tar.zst --noconfirm

sh bootstrap-extras.sh
sh bootstrap-gcc.sh
