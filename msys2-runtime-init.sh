rm -rf /usr/lib/*.origin
pushd ./ports/msys2-runtime
# updpkgsums
# makepkg --cleanbuild --syncdeps --force --noconfirm
# find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist-init/
popd

pacman -U --overwrite \* ./dist-init/msys2-runtime-devel-3.6.5-3-x86_64.pkg.tar.zst --noconfirm
pacman -U --overwrite \* ./dist-init/msys2-runtime-3.6.5-3-x86_64.pkg.tar.zst --noconfirm
pacman -U --overwrite \* ./dist-init/gcc-15.2.0-1-x86_64.pkg.tar.zst --noconfirm
rm -rf /usr/lib/*.origin
