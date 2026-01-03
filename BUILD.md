# MSYS2 building

## Building msys2-runtime

```bash
pushd ./ports/msys2-runtime
updpkgsums
makepkg --cleanbuild --syncdeps --force
tar xf msys2-runtime-devel-3.6.5.1-1-x86_64.pkg.tar.zst  -C /
tar xf msys2-runtime-3.6.5.1-1-x86_64.pkg.tar.zst  -C /
mv msys2-runtime-devel-3.6.5.1-1-x86_64.pkg.tar.zst ../../dist/msys2-runtime-devel-3.6.5.1-1-x86_64-stage0.pkg.tar.zst
mv msys2-runtime-3.6.5.1-1-x86_64.pkg.tar.zst ../../dist/msys2-runtime-3.6.5.1-1-x86_64-stage0.pkg.tar.zst
makepkg --cleanbuild --syncdeps --force
tar xf msys2-runtime-devel-3.6.5.1-1-x86_64.pkg.tar.zst  -C /
tar xf msys2-runtime-3.6.5.1-1-x86_64.pkg.tar.zst  -C /
mv msys2-runtime-devel-3.6.5.1-1-x86_64.pkg.tar.zst ../../dist
mv msys2-runtime-3.6.5.1-1-x86_64.pkg.tar.zst ../../dist/
```

## Building crosstool-ng

```bash
pushd /c/work/xemu/MSYS2-packages/crosstool-ng/
updpkgsums
makepkg --cleanbuild --syncdeps --force --install --noconfirm
```
