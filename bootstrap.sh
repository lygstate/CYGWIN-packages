sh bootstrap-init.sh

# sh bootstrap-msys2-runtime.sh
tar xf ./dist/msys2-runtime-3.6.5-5-x86_64.pkg.tar.zst -C /
mkdir -p ports/gcc/base/
cp -f ./dist/msys2-runtime-devel-3.6.5-5-x86_64.pkg.tar.zst ports/gcc/base/
cp -f ./dist/libiconv-devel-1.18-2-x86_64.pkg.tar.zst ports/gcc/base/

sh bootstrap-gcc-stage0.sh

# Install gcc stage0
# tar xf ./dist-init/gcc-libs-15.2.0-2-x86_64-stage0.pkg.tar.zst  -C /
# tar xf ./dist-init/gcc-15.2.0-2-x86_64-stage0.pkg.tar.zst -C /
# tar xf ./dist/msys2-runtime-devel-3.6.5-5-x86_64.pkg.tar.zst -C /

# sh bootstrap-extras.sh

# sh bootstrap-extras-extract.sh

# sh bootstrap-bash.sh

# tar xf ./dist/bash-5.3.009-2-x86_64.pkg.tar.zst -C /

# sh bootstrap-gcc-stage1.sh
