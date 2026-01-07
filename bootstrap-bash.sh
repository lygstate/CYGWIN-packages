
pushd ./ports/bash
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
popd
