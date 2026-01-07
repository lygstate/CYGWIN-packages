
pushd ./ports/libiconv
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
popd

tar xf ./dist/libiconv-devel-1.18-2-x86_64.pkg.tar.zst -C /
tar xf ./dist/libiconv-1.18-2-x86_64.pkg.tar.zst -C /

pushd ./ports/bash
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
popd
