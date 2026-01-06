rm -rf ./dist/gcc-libs-15.2.0-2-x86_64-stage0.pkg.tar.zst
rm -rf ./dist/gcc-15.2.0-2-x86_64-stage0.pkg.tar.zst

pushd dist-init
# find -name "*.pkg.tar.zst" | xargs -I ARG pacman -U --overwrite \* ARG  --noconfirm
popd

pushd ./ports/gcc
# updpkgsums
makepkg --cleanbuild --syncdeps --force --noconfirm
mv -f gcc-libs-15.2.0-2-x86_64.pkg.tar.zst ../../dist/gcc-libs-15.2.0-2-x86_64-stage0.pkg.tar.zst
mv -f gcc-15.2.0-2-x86_64.pkg.tar.zst ../../dist/gcc-15.2.0-2-x86_64-stage0.pkg.tar.zst
popd

tar xf ./dist/gcc-libs-15.2.0-2-x86_64-stage0.pkg.tar.zst  -C /
tar xf ./dist/gcc-15.2.0-2-x86_64-stage0.pkg.tar.zst -C /
