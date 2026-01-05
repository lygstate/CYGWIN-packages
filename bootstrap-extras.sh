pushd ./ports/gmp
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
popd

pushd ./ports/isl
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
popd

pushd ./ports/mpc
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
popd

pushd ./ports/mpfr
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
popd

pushd ./ports/zlib
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
popd
