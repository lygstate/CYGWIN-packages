rm -rf /usr/lib/*.origin
pacman -U --noconfirm --overwrite \* ./dist-init/msys2-runtime-devel-3.6.5-3-x86_64.pkg.tar.zst
pacman -U --noconfirm --overwrite \* ./dist-init/msys2-runtime-3.6.5-3-x86_64.pkg.tar.zst
pacman -U --noconfirm --overwrite \* ./dist-init/gcc-15.2.0-1-x86_64.pkg.tar.zst
# sh bootstrap-msys2-prepare.sh

# Install cmake and libtool
pacman -U --noconfirm --overwrite \* ./dist-init/libltdl-2.5.4-5-x86_64.pkg.tar.zst
pacman -U --noconfirm --overwrite \* ./dist-init/libtool-2.5.4-5-x86_64.pkg.tar.zst
pacman -U --noconfirm --overwrite \* ./dist-init/cmake-4.2.1-2-x86_64.pkg.tar.zst

# Install binutils
pacman -U --noconfirm --overwrite \* ./dist-init/binutils-2.45.1-2-x86_64-stage0.pkg.tar.zst

pacman -U --noconfirm --overwrite \* ./dist-init/gettext-devel-0.22.5-1-x86_64.pkg.tar.zst
pacman -U --noconfirm --overwrite \* ./dist-init/gmp-devel-6.3.0-2-x86_64.pkg.tar.zst
pacman -U --noconfirm --overwrite \* ./dist-init/isl-devel-0.27-1-x86_64.pkg.tar.zst
pacman -U --noconfirm --overwrite \* ./dist-init/libiconv-devel-1.18-1-x86_64.pkg.tar.zst
pacman -U --noconfirm --overwrite \* ./dist-init/libzstd-devel-1.5.7-1-x86_64.pkg.tar.zst
pacman -U --noconfirm --overwrite \* ./dist-init/mpc-devel-1.3.1-1-x86_64.pkg.tar.zst
pacman -U --noconfirm --overwrite \* ./dist-init/mpfr-devel-4.2.2-1-x86_64.pkg.tar.zst
pacman -U --noconfirm --overwrite \* ./dist-init/zlib-devel-1.3.1-1-x86_64.pkg.tar.zst
