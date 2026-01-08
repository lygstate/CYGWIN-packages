rm -rf /usr/lib/*.origin
tar xf ./dist-init/msys2-runtime-devel-3.6.5-3-x86_64.pkg.tar.zst  -C /

# sh bootstrap-msys2-prepare.sh

# Install cmake and libtool
pacman -U --overwrite \* ./dist/libltdl-2.5.4-5-x86_64.pkg.tar.zst --noconfirm
pacman -U --overwrite \* ./dist/libtool-2.5.4-5-x86_64.pkg.tar.zst --noconfirm
pacman -U --overwrite \* ./dist/cmake-4.2.1-2-x86_64.pkg.tar.zst --noconfirm
pacman -U --overwrite \* ./dist-init/msys2-runtime-devel-3.6.5-3-x86_64.pkg.tar.zst --noconfirm
pacman -U --overwrite \* ./dist-init/msys2-runtime-3.6.5-3-x86_64.pkg.tar.zst --noconfirm
pacman -U --overwrite \* ./dist-init/gcc-15.2.0-1-x86_64.pkg.tar.zst --noconfirm

# Install binutils
pacman -U --overwrite \* ./dist/binutils-2.45.1-2-x86_64-stage0.pkg.tar.zst --noconfirm

# sh bootstrap-gcc-stage0.sh

sh bootstrap-msys2-runtime.sh

# Install gcc stage0
# tar xf ./dist/gcc-libs-15.2.0-2-x86_64-stage0.pkg.tar.zst  -C /
tar xf ./dist/gcc-15.2.0-2-x86_64-stage0.pkg.tar.zst -C /

tar xf ./dist/msys2-runtime-3.6.5-5-x86_64.pkg.tar.zst -C /
tar xf ./dist/msys2-runtime-devel-3.6.5-5-x86_64.pkg.tar.zst -C /

# sh bootstrap-extras.sh

# sh bootstrap-extras-extract.sh

# sh bootstrap-bash.sh

# tar xf ./dist/bash-5.3.009-2-x86_64.pkg.tar.zst -C /

# sh bootstrap-gcc-stage1.sh
