rm -rf /usr/lib/*.origin
pushd ./ports/msys2-runtime
# updpkgsums
# makepkg --cleanbuild --syncdeps --force --noconfirm
# find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist-init/
popd

tar xf ./dist-init/msys2-runtime-devel-3.6.5-3-x86_64.pkg.tar.zst  -C /
tar xf ./dist-init/msys2-runtime-3.6.5-3-x86_64.pkg.tar.zst  -C /
rm -rf /usr/lib/*.origin
