rm -rf /usr/lib/*.origin

# sh bootstrap-msys2-prepare.sh

# Install cmake and libtool
pacman -U --overwrite \* ./dist/libltdl-2.5.4-5-x86_64.pkg.tar.zst --noconfirm
pacman -U --overwrite \* ./dist/libtool-2.5.4-5-x86_64.pkg.tar.zst --noconfirm
pacman -U --overwrite \* ./dist/cmake-4.2.1-2-x86_64.pkg.tar.zst --noconfirm

# Install binutils
pacman -U --overwrite \* ./dist/binutils-2.45.1-2-x86_64-stage0.pkg.tar.zst --noconfirm

sh bootstrap-msys2-runtime.sh
tar xf ./dist/msys2-runtime-3.6.5-4-x86_64.pkg.tar.zst -C /
tar xf ./dist/msys2-runtime-devel-3.6.5-4-x86_64.pkg.tar.zst -C /

# sh bootstrap-extras.sh

sh bootstrap-extras-extract.sh

sh bootstrap-bash.sh
mv bash-5.3.009-1-x86_64.pkg.tar.zst ../../dist/

# sh bootstrap-gcc.sh
