rm -rf ./dist/gcc-libs-15.2.0-2-x86_64-stage1.pkg.tar.zst
rm -rf ./dist/gcc-15.2.0-2-x86_64-stage1.pkg.tar.zst
rm -rf ./ports/gcc/base/*.pkg.tar.zst

mkdir -p ports/gcc/base/
cp -f ./dist/binutils-2.45.1-2-x86_64-stage1.pkg.tar.zst ports/gcc/base/

pushd ./ports/gcc
# updpkgsums
makepkg --cleanbuild --syncdeps --force --noconfirm
mv -f gcc-libs-15.2.0-2-x86_64.pkg.tar.zst ../../dist/gcc-libs-15.2.0-2-x86_64-stage1.pkg.tar.zst
mv -f gcc-15.2.0-2-x86_64.pkg.tar.zst ../../dist/gcc-15.2.0-2-x86_64-stage1.pkg.tar.zst
popd
rm -f ./dist/gcc-libs-15.2.0-2-x86_64-stage1.pkg.tar.zst
cp -af ./dist-init/gcc-libs-15.2.0-2-x86_64-stage0.pkg.tar.zst ./dist/gcc-libs-15.2.0-2-x86_64-stage1.pkg.tar.zst
