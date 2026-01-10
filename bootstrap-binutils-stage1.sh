# Building/install binutils
pushd ./ports/binutils
makepkg --cleanbuild --syncdeps --force --noconfirm
mv -f binutils-2.45.1-2-x86_64.pkg.tar.zst ../../dist/binutils-2.45.1-2-x86_64-stage1.pkg.tar.zst
popd
