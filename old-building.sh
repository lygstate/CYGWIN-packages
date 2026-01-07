
pushd ./ports/which
makepkg --cleanbuild --syncdeps --force --noconfirm
mv which-2.23-4-x86_64.pkg.tar.zst ../../dist/
popd
