
pushd ./ports/libiconv
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
mv -f *.pkg.tar.zst ../../dist/
popd

tar xf ./dist/libiconv-devel-1.18-2-x86_64.pkg.tar.zst -C /
