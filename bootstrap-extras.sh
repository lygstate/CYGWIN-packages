pushd ./ports/libiconv
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
popd

tar xf ./dist/libiconv-devel-1.18-2-x86_64.pkg.tar.zst -C /
tar xf ./dist/libiconv-1.18-2-x86_64.pkg.tar.zst -C /

pushd ./ports/gmp
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
popd

tar xf ./dist/gmp-6.3.0-3-x86_64.pkg.tar.zst -C /
tar xf ./dist/gmp-devel-6.3.0-3-x86_64.pkg.tar.zst -C /

pushd ./ports/isl
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
popd

tar xf ./dist/isl-0.27-2-x86_64.pkg.tar.zst -C /
tar xf ./dist/isl-devel-0.27-2-x86_64.pkg.tar.zst -C /

pushd ./ports/mpc
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
popd

tar xf ./dist/mpc-devel-1.3.1-2-x86_64.pkg.tar.zst -C /
tar xf ./dist/mpc-1.3.1-2-x86_64.pkg.tar.zst -C /

pushd ./ports/mpfr
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
popd

tar xf ./dist/mpfr-devel-4.2.2-2-x86_64.pkg.tar.zst -C /
tar xf ./dist/mpfr-4.2.2-2-x86_64.pkg.tar.zst -C /

pushd ./ports/zlib
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
popd

tar xf ./dist/zlib-devel-1.3.1-2-x86_64.pkg.tar.zst -C /
tar xf ./dist/zlib-1.3.1-2-x86_64.pkg.tar.zst -C /

pushd ./ports/gettext/
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
popd

tar xf ./dist/gettext-0.22.5-2-x86_64.pkg.tar.zst -C /
tar xf ./dist/gettext-devel-0.22.5-2-x86_64.pkg.tar.zst -C /
tar xf ./dist/libasprintf-0.22.5-2-x86_64.pkg.tar.zst -C /
tar xf ./dist/libgettextpo-0.22.5-2-x86_64.pkg.tar.zst -C /
tar xf ./dist/libintl-0.22.5-2-x86_64.pkg.tar.zst -C /

# libiconv twice

pushd ./ports/libiconv
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
popd

tar xf ./dist/libiconv-devel-1.18-2-x86_64.pkg.tar.zst -C /
tar xf ./dist/libiconv-1.18-2-x86_64.pkg.tar.zst -C /

pushd ./ports/zstd
# updpkgsums
makepkg --cleanbuild --syncdeps --force --noconfirm
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
popd
tar xf ./dist/libzstd-1.5.7-2-x86_64.pkg.tar.zst -C /
tar xf ./dist/libzstd-devel-1.5.7-2-x86_64.pkg.tar.zst -C /
tar xf ./dist/zstd-1.5.7-2-x86_64.pkg.tar.zst -C /
