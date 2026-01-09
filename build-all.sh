pushd ./ports/groff
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: groff with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building groff finished"
popd
pushd ./ports/gzip
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: gzip with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building gzip finished"
popd
pushd ./ports/icmake
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: icmake with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building icmake finished"
popd
pushd ./ports/iperf
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: iperf with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building iperf finished"
popd
pushd ./ports/itstool
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: itstool with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building itstool finished"
popd
pushd ./ports/jansson
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: jansson with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building jansson finished"
popd
pushd ./ports/jq
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: jq with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building jq finished"
popd
pushd ./ports/libargp
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: libargp with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building libargp finished"
popd
pushd ./ports/libatomic_ops
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: libatomic_ops with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building libatomic_ops finished"
popd
pushd ./ports/libblake3
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: libblake3 with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building libblake3 finished"
popd
pushd ./ports/libbobcat
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: libbobcat with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building libbobcat finished"
popd
pushd ./ports/libbsd
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: libbsd with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building libbsd finished"
popd
pushd ./ports/libcbor
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: libcbor with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building libcbor finished"
popd
pushd ./ports/libffi
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: libffi with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building libffi finished"
popd
pushd ./ports/libmd
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: libmd with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building libmd finished"
popd
pushd ./ports/libqrencode
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: libqrencode with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building libqrencode finished"
popd
pushd ./ports/libunistring
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: libunistring with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building libunistring finished"
popd
pushd ./ports/libuv
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: libuv with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building libuv finished"
popd
pushd ./ports/libxcrypt
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: libxcrypt with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building libxcrypt finished"
popd
pushd ./ports/libyaml
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: libyaml with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building libyaml finished"
popd
pushd ./ports/lua
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: lua with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building lua finished"
popd
pushd ./ports/lz4
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: lz4 with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building lz4 finished"
popd
pushd ./ports/lzip
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: lzip with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building lzip finished"
popd
pushd ./ports/m4
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: m4 with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building m4 finished"
popd
pushd ./ports/man-pages-posix
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: man-pages-posix with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building man-pages-posix finished"
popd
pushd ./ports/mingw-w64-cross-headers
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: mingw-w64-cross-headers with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building mingw-w64-cross-headers finished"
popd
pushd ./ports/mingw-w64-cross-mingwarm64-headers
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: mingw-w64-cross-mingwarm64-headers with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building mingw-w64-cross-mingwarm64-headers finished"
popd
pushd ./ports/mingw-w64-cross-zlib
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: mingw-w64-cross-zlib with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building mingw-w64-cross-zlib finished"
popd
pushd ./ports/mintty
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: mintty with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building mintty finished"
popd
pushd ./ports/mksh
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: mksh with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building mksh finished"
popd
pushd ./ports/mpdecimal
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: mpdecimal with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building mpdecimal finished"
popd
pushd ./ports/msgpack-c
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: msgpack-c with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building msgpack-c finished"
popd
pushd ./ports/ncurses
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: ncurses with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building ncurses finished"
popd
pushd ./ports/neofetch
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: neofetch with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building neofetch finished"
popd
pushd ./ports/nghttp3
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: nghttp3 with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building nghttp3 finished"
popd
pushd ./ports/npth
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: npth with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building npth finished"
popd
pushd ./ports/nsinstall
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: nsinstall with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building nsinstall finished"
popd
pushd ./ports/nyacc
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: nyacc with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building nyacc finished"
popd
pushd ./ports/oniguruma
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: oniguruma with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building oniguruma finished"
popd
pushd ./ports/pactoys
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: pactoys with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building pactoys finished"
popd
pushd ./ports/pax
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: pax with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building pax finished"
popd
pushd ./ports/perl-Digest-HMAC
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-Digest-HMAC with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-Digest-HMAC finished"
popd
pushd ./ports/perl-Encode-Locale
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-Encode-Locale with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-Encode-Locale finished"
popd
pushd ./ports/perl-ExtUtils-PkgConfig
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-ExtUtils-PkgConfig with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-ExtUtils-PkgConfig finished"
popd
pushd ./ports/perl-File-Listing
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-File-Listing with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-File-Listing finished"
popd
pushd ./ports/perl-HTML-Tagset
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-HTML-Tagset with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-HTML-Tagset finished"
popd
pushd ./ports/perl-HTTP-Date
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-HTTP-Date with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-HTTP-Date finished"
popd
pushd ./ports/perl-Import-Into
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-Import-Into with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-Import-Into finished"
popd
pushd ./ports/perl-inc-latest
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-inc-latest with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-inc-latest finished"
popd
pushd ./ports/perl-IO-Socket-INET6
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-IO-Socket-INET6 with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-IO-Socket-INET6 finished"
popd
pushd ./ports/perl-IO-String
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-IO-String with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-IO-String finished"
popd
pushd ./ports/perl-JSON
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-JSON with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-JSON finished"
popd
pushd ./ports/perl-Moo
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-Moo with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-Moo finished"
popd
pushd ./ports/perl-Mozilla-CA
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-Mozilla-CA with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-Mozilla-CA finished"
popd
pushd ./ports/perl-Net-DNS
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-Net-DNS with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-Net-DNS finished"
popd
pushd ./ports/perl-Net-HTTP
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-Net-HTTP with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-Net-HTTP finished"
popd
pushd ./ports/perl-Net-IP
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-Net-IP with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-Net-IP finished"
popd
pushd ./ports/perl-Path-Tiny
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-Path-Tiny with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-Path-Tiny finished"
popd
pushd ./ports/perl-Sub-Quote
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-Sub-Quote with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-Sub-Quote finished"
popd
pushd ./ports/perl-URI
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-URI with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-URI finished"
popd
pushd ./ports/publicsuffix-list
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: publicsuffix-list with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building publicsuffix-list finished"
popd
pushd ./ports/pwgen
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: pwgen with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building pwgen finished"
popd
pushd ./ports/quilt
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: quilt with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building quilt finished"
popd
pushd ./ports/reflex
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: reflex with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building reflex finished"
popd
pushd ./ports/setconf
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: setconf with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building setconf finished"
popd
pushd ./ports/sgml-common
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: sgml-common with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building sgml-common finished"
popd
pushd ./ports/shutdown
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: shutdown with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building shutdown finished"
popd
pushd ./ports/ssh-pageant
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: ssh-pageant with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building ssh-pageant finished"
popd
pushd ./ports/sshpass
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: sshpass with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building sshpass finished"
popd
pushd ./ports/stow
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: stow with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building stow finished"
popd
pushd ./ports/tcl
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: tcl with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building tcl finished"
popd
pushd ./ports/time
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: time with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building time finished"
popd
pushd ./ports/tree
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: tree with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building tree finished"
popd
pushd ./ports/tzcode
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: tzcode with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building tzcode finished"
popd
pushd ./ports/ucl
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: ucl with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building ucl finished"
popd
pushd ./ports/unrar
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: unrar with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building unrar finished"
popd
pushd ./ports/vimpager
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: vimpager with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building vimpager finished"
popd
pushd ./ports/which
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: which with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building which finished"
popd
pushd ./ports/windows-default-manifest
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: windows-default-manifest with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building windows-default-manifest finished"
popd
pushd ./ports/xorg-util-macros
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: xorg-util-macros with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building xorg-util-macros finished"
popd
pushd ./ports/xxhash
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: xxhash with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building xxhash finished"
popd
pushd ./ports/yodl
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: yodl with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building yodl finished"
popd
pushd ./ports/zip
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: zip with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building zip finished"
popd
pushd ./ports/zlib
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: zlib with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building zlib finished"
popd
pushd ./ports/zstd
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: zstd with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building zstd finished"
popd
pushd ./ports/apr
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: apr with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building apr finished"
popd
pushd ./ports/bisoncpp
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: bisoncpp with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building bisoncpp finished"
popd
pushd ./ports/busybox
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: busybox with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building busybox finished"
popd
pushd ./ports/cmatrix
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: cmatrix with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building cmatrix finished"
popd
pushd ./ports/cocom
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: cocom with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building cocom finished"
popd
pushd ./ports/cscope
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: cscope with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building cscope finished"
popd
pushd ./ports/docbook-sgml
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: docbook-sgml with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building docbook-sgml finished"
popd
pushd ./ports/docbook-sgml31
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: docbook-sgml31 with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building docbook-sgml31 finished"
popd
pushd ./ports/expect
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: expect with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building expect finished"
popd
pushd ./ports/getent
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: getent with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building getent finished"
popd
pushd ./ports/gettext
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: gettext with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building gettext finished"
popd
pushd ./ports/hexcurse
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: hexcurse with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building hexcurse finished"
popd
pushd ./ports/icu
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: icu with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building icu finished"
popd
pushd ./ports/isl
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: isl with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building isl finished"
popd
pushd ./ports/joe
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: joe with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building joe finished"
popd
pushd ./ports/libedit
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: libedit with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building libedit finished"
popd
pushd ./ports/mpfr
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: mpfr with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building mpfr finished"
popd
pushd ./ports/ncdu
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: ncdu with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building ncdu finished"
popd
pushd ./ports/nettle
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: nettle with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building nettle finished"
popd
pushd ./ports/pass
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: pass with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building pass finished"
popd
pushd ./ports/patch
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: patch with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building patch finished"
popd
pushd ./ports/perl-Font-TTF
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-Font-TTF with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-Font-TTF finished"
popd
pushd ./ports/perl-http-cookiejar
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-http-cookiejar with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-http-cookiejar finished"
popd
pushd ./ports/perl-Module-Build
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-Module-Build with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-Module-Build finished"
popd
pushd ./ports/protobuf
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: protobuf with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building protobuf finished"
popd
pushd ./ports/rcs
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: rcs with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building rcs finished"
popd
pushd ./ports/readline
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: readline with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building readline finished"
popd
pushd ./ports/tcsh
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: tcsh with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building tcsh finished"
popd
pushd ./ports/upx
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: upx with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building upx finished"
popd
pushd ./ports/vifm
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: vifm with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building vifm finished"
popd
pushd ./ports/aspell
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: aspell with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building aspell finished"
popd
pushd ./ports/bash
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: bash with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building bash finished"
popd
pushd ./ports/bc
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: bc with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building bc finished"
popd
pushd ./ports/bzip2
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: bzip2 with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building bzip2 finished"
popd
pushd ./ports/cpio
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: cpio with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building cpio finished"
popd
pushd ./ports/dialog
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: dialog with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building dialog finished"
popd
pushd ./ports/diffutils
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: diffutils with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building diffutils finished"
popd
pushd ./ports/enscript
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: enscript with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building enscript finished"
popd
pushd ./ports/findutils
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: findutils with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building findutils finished"
popd
pushd ./ports/flex
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: flex with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building flex finished"
popd
pushd ./ports/gawk
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: gawk with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building gawk finished"
popd
pushd ./ports/gdbm
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: gdbm with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building gdbm finished"
popd
pushd ./ports/gnulib-l10n
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: gnulib-l10n with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building gnulib-l10n finished"
popd
pushd ./ports/help2man
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: help2man with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building help2man finished"
popd
pushd ./ports/idutils
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: idutils with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building idutils finished"
popd
pushd ./ports/libgpg-error
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: libgpg-error with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building libgpg-error finished"
popd
pushd ./ports/libtre
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: libtre with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building libtre finished"
popd
pushd ./ports/libxml2
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: libxml2 with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building libxml2 finished"
popd
pushd ./ports/luit
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: luit with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building luit finished"
popd
pushd ./ports/lzo2
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: lzo2 with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building lzo2 finished"
popd
pushd ./ports/mingw-w64-cross-binutils
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: mingw-w64-cross-binutils with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building mingw-w64-cross-binutils finished"
popd
pushd ./ports/mingw-w64-cross-mingwarm64-binutils
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: mingw-w64-cross-mingwarm64-binutils with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building mingw-w64-cross-mingwarm64-binutils finished"
popd
pushd ./ports/mpc
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: mpc with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building mpc finished"
popd
pushd ./ports/nano
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: nano with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building nano finished"
popd
pushd ./ports/perl-Module-Runtime
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-Module-Runtime with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-Module-Runtime finished"
popd
pushd ./ports/perl-TAP-Harness-Archive
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-TAP-Harness-Archive with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-TAP-Harness-Archive finished"
popd
pushd ./ports/popt
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: popt with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building popt finished"
popd
pushd ./ports/procps-ng
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: procps-ng with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building procps-ng finished"
popd
pushd ./ports/psmisc
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: psmisc with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building psmisc finished"
popd
pushd ./ports/pv
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: pv with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building pv finished"
popd
pushd ./ports/rlwrap
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: rlwrap with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building rlwrap finished"
popd
pushd ./ports/rpcsvc-proto
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: rpcsvc-proto with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building rpcsvc-proto finished"
popd
pushd ./ports/sed
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: sed with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building sed finished"
popd
pushd ./ports/sharutils
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: sharutils with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building sharutils finished"
popd
pushd ./ports/sqlite
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: sqlite with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building sqlite finished"
popd
pushd ./ports/tar
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: tar with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building tar finished"
popd
pushd ./ports/tftp-hpa
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: tftp-hpa with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building tftp-hpa finished"
popd
pushd ./ports/txt2html
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: txt2html with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building txt2html finished"
popd
pushd ./ports/apr-util
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: apr-util with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building apr-util finished"
popd
pushd ./ports/aspell-en
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: aspell-en with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building aspell-en finished"
popd
pushd ./ports/bison
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: bison with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building bison finished"
popd
pushd ./ports/cflow
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: cflow with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building cflow finished"
popd
pushd ./ports/cgdb
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: cgdb with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building cgdb finished"
popd
pushd ./ports/coreutils
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: coreutils with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building coreutils finished"
popd
pushd ./ports/cygutils
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: cygutils with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building cygutils finished"
popd
pushd ./ports/docbook-mathml
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: docbook-mathml with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building docbook-mathml finished"
popd
pushd ./ports/docbook-xml
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: docbook-xml with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building docbook-xml finished"
popd
pushd ./ports/etc-update
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: etc-update with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building etc-update finished"
popd
pushd ./ports/inetutils
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: inetutils with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building inetutils finished"
popd
pushd ./ports/libassuan
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: libassuan with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building libassuan finished"
popd
pushd ./ports/libgcrypt
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: libgcrypt with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building libgcrypt finished"
popd
pushd ./ports/libksba
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: libksba with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building libksba finished"
popd
pushd ./ports/lzop
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: lzop with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building lzop finished"
popd
pushd ./ports/mingw-w64-cross-crt
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: mingw-w64-cross-crt with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building mingw-w64-cross-crt finished"
popd
pushd ./ports/mingw-w64-cross-mingwarm64-crt
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: mingw-w64-cross-mingwarm64-crt with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building mingw-w64-cross-mingwarm64-crt finished"
popd
pushd ./ports/mingw-w64-cross-mingwarm64-tools
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: mingw-w64-cross-mingwarm64-tools with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building mingw-w64-cross-mingwarm64-tools finished"
popd
pushd ./ports/mingw-w64-cross-mingwarm64-windows-default-manifest
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: mingw-w64-cross-mingwarm64-windows-default-manifest with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building mingw-w64-cross-mingwarm64-windows-default-manifest finished"
popd
pushd ./ports/mingw-w64-cross-tools
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: mingw-w64-cross-tools with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building mingw-w64-cross-tools finished"
popd
pushd ./ports/mingw-w64-cross-windows-default-manifest
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: mingw-w64-cross-windows-default-manifest with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building mingw-w64-cross-windows-default-manifest finished"
popd
pushd ./ports/nano-syntax-highlighting
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: nano-syntax-highlighting with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building nano-syntax-highlighting finished"
popd
pushd ./ports/pcre
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: pcre with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building pcre finished"
popd
pushd ./ports/pcre2
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: pcre2 with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building pcre2 finished"
popd
pushd ./ports/perl
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl finished"
popd
pushd ./ports/screenfetch
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: screenfetch with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building screenfetch finished"
popd
pushd ./ports/shellspec
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: shellspec with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building shellspec finished"
popd
pushd ./ports/unzip
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: unzip with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building unzip finished"
popd
pushd ./ports/xorriso
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: xorriso with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building xorriso finished"
popd
pushd ./ports/cdecl
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: cdecl with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building cdecl finished"
popd
pushd ./ports/ctags
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: ctags with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building ctags finished"
popd
pushd ./ports/docbook-dsssl
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: docbook-dsssl with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building docbook-dsssl finished"
popd
pushd ./ports/dos2unix
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: dos2unix with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building dos2unix finished"
popd
pushd ./ports/gengetopt
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: gengetopt with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building gengetopt finished"
popd
pushd ./ports/gpgme
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: gpgme with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building gpgme finished"
popd
pushd ./ports/intltool
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: intltool with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building intltool finished"
popd
pushd ./ports/less
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: less with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building less finished"
popd
pushd ./ports/libxslt
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: libxslt with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building libxslt finished"
popd
pushd ./ports/markdown
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: markdown with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building markdown finished"
popd
pushd ./ports/mingw-w64-cross-mingwarm64-winpthreads
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: mingw-w64-cross-mingwarm64-winpthreads with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building mingw-w64-cross-mingwarm64-winpthreads finished"
popd
pushd ./ports/mingw-w64-cross-mingwarm64-winstorecompat
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: mingw-w64-cross-mingwarm64-winstorecompat with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building mingw-w64-cross-mingwarm64-winstorecompat finished"
popd
pushd ./ports/mingw-w64-cross-winpthreads
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: mingw-w64-cross-winpthreads with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building mingw-w64-cross-winpthreads finished"
popd
pushd ./ports/mingw-w64-cross-winstorecompat
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: mingw-w64-cross-winstorecompat with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building mingw-w64-cross-winstorecompat finished"
popd
pushd ./ports/nawk
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: nawk with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building nawk finished"
popd
pushd ./ports/perl-Algorithm-Diff
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-Algorithm-Diff with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-Algorithm-Diff finished"
popd
pushd ./ports/perl-Archive-Zip
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-Archive-Zip with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-Archive-Zip finished"
popd
pushd ./ports/perl-Authen-SASL
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-Authen-SASL with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-Authen-SASL finished"
popd
pushd ./ports/perl-Benchmark-Timer
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-Benchmark-Timer with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-Benchmark-Timer finished"
popd
pushd ./ports/perl-Capture-Tiny
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-Capture-Tiny with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-Capture-Tiny finished"
popd
pushd ./ports/perl-Carp-Clan
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-Carp-Clan with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-Carp-Clan finished"
popd
pushd ./ports/perl-Clone
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-Clone with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-Clone finished"
popd
pushd ./ports/perl-common-sense
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-common-sense with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-common-sense finished"
popd
pushd ./ports/perl-Compress-Bzip2
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-Compress-Bzip2 with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-Compress-Bzip2 finished"
popd
pushd ./ports/perl-Convert-BinHex
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-Convert-BinHex with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-Convert-BinHex finished"
popd
pushd ./ports/perl-Data-Munge
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-Data-Munge with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-Data-Munge finished"
popd
pushd ./ports/perl-Date-Calc
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-Date-Calc with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-Date-Calc finished"
popd
pushd ./ports/perl-DBI
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-DBI with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-DBI finished"
popd
pushd ./ports/perl-Encode-compat
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-Encode-compat with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-Encode-compat finished"
popd
pushd ./ports/perl-Error
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-Error with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-Error finished"
popd
pushd ./ports/perl-Exporter-Lite
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-Exporter-Lite with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-Exporter-Lite finished"
popd
pushd ./ports/perl-Exporter-Tiny
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-Exporter-Tiny with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-Exporter-Tiny finished"
popd
pushd ./ports/perl-ExtUtils-Config
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-ExtUtils-Config with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-ExtUtils-Config finished"
popd
pushd ./ports/perl-ExtUtils-Depends
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-ExtUtils-Depends with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-ExtUtils-Depends finished"
popd
pushd ./ports/perl-ExtUtils-Helpers
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-ExtUtils-Helpers with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-ExtUtils-Helpers finished"
popd
pushd ./ports/perl-ExtUtils-MakeMaker
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-ExtUtils-MakeMaker with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-ExtUtils-MakeMaker finished"
popd
pushd ./ports/perl-FFI-CheckLib
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-FFI-CheckLib with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-FFI-CheckLib finished"
popd
pushd ./ports/perl-File-chdir
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-File-chdir with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-File-chdir finished"
popd
pushd ./ports/perl-File-Copy-Recursive
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-File-Copy-Recursive with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-File-Copy-Recursive finished"
popd
pushd ./ports/perl-File-Next
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-File-Next with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-File-Next finished"
popd
pushd ./ports/perl-File-Which
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-File-Which with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-File-Which finished"
popd
pushd ./ports/perl-Getopt-ArgvFile
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-Getopt-ArgvFile with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-Getopt-ArgvFile finished"
popd
pushd ./ports/perl-Getopt-Tabular
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-Getopt-Tabular with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-Getopt-Tabular finished"
popd
pushd ./ports/perl-HTML-Parser
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-HTML-Parser with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-HTML-Parser finished"
popd
pushd ./ports/perl-Importer
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-Importer with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-Importer finished"
popd
pushd ./ports/perl-IO-HTML
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-IO-HTML with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-IO-HTML finished"
popd
pushd ./ports/perl-IO-Stringy
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-IO-Stringy with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-IO-Stringy finished"
popd
pushd ./ports/perl-IPC-Run3
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-IPC-Run3 with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-IPC-Run3 finished"
popd
pushd ./ports/perl-List-MoreUtils
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-List-MoreUtils with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-List-MoreUtils finished"
popd
pushd ./ports/perl-List-MoreUtils-XS
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-List-MoreUtils-XS with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-List-MoreUtils-XS finished"
popd
pushd ./ports/perl-Locale-Gettext
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-Locale-Gettext with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-Locale-Gettext finished"
popd
pushd ./ports/perl-LWP-MediaTypes
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-LWP-MediaTypes with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-LWP-MediaTypes finished"
popd
pushd ./ports/perl-Math-Int64
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-Math-Int64 with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-Math-Int64 finished"
popd
pushd ./ports/perl-MIME-Charset
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-MIME-Charset with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-MIME-Charset finished"
popd
pushd ./ports/perl-Module-Pluggable
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-Module-Pluggable with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-Module-Pluggable finished"
popd
pushd ./ports/perl-Params-Util
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-Params-Util with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-Params-Util finished"
popd
pushd ./ports/perl-Path-Class
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-Path-Class with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-Path-Class finished"
popd
pushd ./ports/perl-PerlIO-gzip
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-PerlIO-gzip with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-PerlIO-gzip finished"
popd
pushd ./ports/perl-Pod-Parser
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-Pod-Parser with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-Pod-Parser finished"
popd
pushd ./ports/perl-Probe-Perl
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-Probe-Perl with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-Probe-Perl finished"
popd
pushd ./ports/perl-Regexp-Common
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-Regexp-Common with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-Regexp-Common finished"
popd
pushd ./ports/perl-Role-Tiny
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-Role-Tiny with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-Role-Tiny finished"
popd
pushd ./ports/perl-Scope-Guard
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-Scope-Guard with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-Scope-Guard finished"
popd
pushd ./ports/perl-sgmls
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-sgmls with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-sgmls finished"
popd
pushd ./ports/perl-Socket6
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-Socket6 with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-Socket6 finished"
popd
pushd ./ports/perl-Sort-Versions
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-Sort-Versions with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-Sort-Versions finished"
popd
pushd ./ports/perl-Spiffy
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-Spiffy with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-Spiffy finished"
popd
pushd ./ports/perl-Sub-Exporter-Progressive
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-Sub-Exporter-Progressive with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-Sub-Exporter-Progressive finished"
popd
pushd ./ports/perl-Sub-Install
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-Sub-Install with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-Sub-Install finished"
popd
pushd ./ports/perl-TermReadKey
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-TermReadKey with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-TermReadKey finished"
popd
pushd ./ports/perl-Test-Needs
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-Test-Needs with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-Test-Needs finished"
popd
pushd ./ports/perl-Test-NoWarnings
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-Test-NoWarnings with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-Test-NoWarnings finished"
popd
pushd ./ports/perl-Test-Pod
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-Test-Pod with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-Test-Pod finished"
popd
pushd ./ports/perl-Test-Requires
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-Test-Requires with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-Test-Requires finished"
popd
pushd ./ports/perl-Test-Requiresinternet
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-Test-Requiresinternet with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-Test-Requiresinternet finished"
popd
pushd ./ports/perl-Test-Warnings
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-Test-Warnings with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-Test-Warnings finished"
popd
pushd ./ports/perl-Text-CharWidth
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-Text-CharWidth with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-Text-CharWidth finished"
popd
pushd ./ports/perl-TimeDate
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-TimeDate with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-TimeDate finished"
popd
pushd ./ports/perl-Try-Tiny
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-Try-Tiny with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-Try-Tiny finished"
popd
pushd ./ports/perl-Unicode-LineBreak
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-Unicode-LineBreak with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-Unicode-LineBreak finished"
popd
pushd ./ports/perl-WWW-RobotRules
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-WWW-RobotRules with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-WWW-RobotRules finished"
popd
pushd ./ports/perl-XML-LibXML
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-XML-LibXML with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-XML-LibXML finished"
popd
pushd ./ports/perl-XML-NamespaceSupport
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-XML-NamespaceSupport with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-XML-NamespaceSupport finished"
popd
pushd ./ports/perl-XML-Parser
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-XML-Parser with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-XML-Parser finished"
popd
pushd ./ports/perl-XML-SAX-Base
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-XML-SAX-Base with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-XML-SAX-Base finished"
popd
pushd ./ports/perl-YAML-Syck
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-YAML-Syck with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-YAML-Syck finished"
popd
pushd ./ports/perl-YAML-Tiny
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-YAML-Tiny with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-YAML-Tiny finished"
popd
pushd ./ports/pinentry
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: pinentry with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building pinentry finished"
popd
pushd ./ports/swig
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: swig with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building swig finished"
popd
pushd ./ports/texinfo
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: texinfo with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building texinfo finished"
popd
pushd ./ports/wcd
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: wcd with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building wcd finished"
popd
pushd ./ports/zsh
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: zsh with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building zsh finished"
popd
pushd ./ports/ack
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: ack with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building ack finished"
popd
pushd ./ports/automake1.17
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: automake1.17 with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building automake1.17 finished"
popd
pushd ./ports/automake1.18
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: automake1.18 with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building automake1.18 finished"
popd
pushd ./ports/docbook-xsl
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: docbook-xsl with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building docbook-xsl finished"
popd
pushd ./ports/docbook-xsl-ns
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: docbook-xsl-ns with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building docbook-xsl-ns finished"
popd
pushd ./ports/gperf
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: gperf with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building gperf finished"
popd
pushd ./ports/grep
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: grep with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building grep finished"
popd
pushd ./ports/lcov
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: lcov with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building lcov finished"
popd
pushd ./ports/nasm
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: nasm with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building nasm finished"
popd
pushd ./ports/perl-Data-OptList
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-Data-OptList with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-Data-OptList finished"
popd
pushd ./ports/perl-ExtUtils-InstallPaths
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-ExtUtils-InstallPaths with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-ExtUtils-InstallPaths finished"
popd
pushd ./ports/perl-HTTP-Message
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-HTTP-Message with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-HTTP-Message finished"
popd
pushd ./ports/perl-MailTools
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-MailTools with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-MailTools finished"
popd
pushd ./ports/perl-PadWalker
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-PadWalker with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-PadWalker finished"
popd
pushd ./ports/perl-Parallel-ForkManager
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-Parallel-ForkManager with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-Parallel-ForkManager finished"
popd
pushd ./ports/perl-Return-MultiLevel
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-Return-MultiLevel with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-Return-MultiLevel finished"
popd
pushd ./ports/perl-Sub-Info
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-Sub-Info with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-Sub-Info finished"
popd
pushd ./ports/perl-Test-Deep
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-Test-Deep with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-Test-Deep finished"
popd
pushd ./ports/perl-Test-Fatal
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-Test-Fatal with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-Test-Fatal finished"
popd
pushd ./ports/perl-Test-Script
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-Test-Script with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-Test-Script finished"
popd
pushd ./ports/perl-Text-Diff
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-Text-Diff with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-Text-Diff finished"
popd
pushd ./ports/perl-Text-WrapI18N
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-Text-WrapI18N with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-Text-WrapI18N finished"
popd
pushd ./ports/perl-XML-SAX
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-XML-SAX with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-XML-SAX finished"
popd
pushd ./ports/perl-XML-Simple
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-XML-Simple with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-XML-Simple finished"
popd
pushd ./ports/cloc
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: cloc with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building cloc finished"
popd
pushd ./ports/global
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: global with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building global finished"
popd
pushd ./ports/moreutils
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: moreutils with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building moreutils finished"
popd
pushd ./ports/openssl
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: openssl with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building openssl finished"
popd
pushd ./ports/p7zip
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: p7zip with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building p7zip finished"
popd
pushd ./ports/perl-Class-Method-Modifiers
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-Class-Method-Modifiers with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-Class-Method-Modifiers finished"
popd
pushd ./ports/perl-HTTP-Cookies
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-HTTP-Cookies with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-HTTP-Cookies finished"
popd
pushd ./ports/perl-HTTP-Negotiate
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-HTTP-Negotiate with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-HTTP-Negotiate finished"
popd
pushd ./ports/perl-MIME-tools
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-MIME-tools with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-MIME-tools finished"
popd
pushd ./ports/perl-Module-Build-Tiny
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-Module-Build-Tiny with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-Module-Build-Tiny finished"
popd
pushd ./ports/perl-Sub-Exporter
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-Sub-Exporter with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-Sub-Exporter finished"
popd
pushd ./ports/perl-Test-Base
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-Test-Base with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-Test-Base finished"
popd
pushd ./ports/perl-Test-Exit
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-Test-Exit with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-Test-Exit finished"
popd
pushd ./ports/perl-Test2-Suite
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-Test2-Suite with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-Test2-Suite finished"
popd
pushd ./ports/po4a
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: po4a with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building po4a finished"
popd
pushd ./ports/rebase
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: rebase with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building rebase finished"
popd
pushd ./ports/xmlto
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: xmlto with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building xmlto finished"
popd
pushd ./ports/axel
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: axel with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building axel finished"
popd
pushd ./ports/git-crypt
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: git-crypt with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building git-crypt finished"
popd
pushd ./ports/iperf3
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: iperf3 with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building iperf3 finished"
popd
pushd ./ports/libevent
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: libevent with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building libevent finished"
popd
pushd ./ports/libfido2
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: libfido2 with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building libfido2 finished"
popd
pushd ./ports/libpcap
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: libpcap with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building libpcap finished"
popd
pushd ./ports/libpipeline
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: libpipeline with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building libpipeline finished"
popd
pushd ./ports/libssh2
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: libssh2 with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building libssh2 finished"
popd
pushd ./ports/mosh
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: mosh with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building mosh finished"
popd
pushd ./ports/mosquitto
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: mosquitto with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building mosquitto finished"
popd
pushd ./ports/neon
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: neon with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building neon finished"
popd
pushd ./ports/ngtcp2
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: ngtcp2 with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building ngtcp2 finished"
popd
pushd ./ports/opensp
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: opensp with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building opensp finished"
popd
pushd ./ports/patchutils
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: patchutils with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building patchutils finished"
popd
pushd ./ports/perl-Alien-Build
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-Alien-Build with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-Alien-Build finished"
popd
pushd ./ports/perl-alien-build-plugin-download-gitlab
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-alien-build-plugin-download-gitlab with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-alien-build-plugin-download-gitlab finished"
popd
pushd ./ports/perl-Devel-GlobalDestruction
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-Devel-GlobalDestruction with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-Devel-GlobalDestruction finished"
popd
pushd ./ports/perl-HTTP-Daemon
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-HTTP-Daemon with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-HTTP-Daemon finished"
popd
pushd ./ports/perl-Net-SSLeay
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-Net-SSLeay with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-Net-SSLeay finished"
popd
pushd ./ports/perl-Test-YAML
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-Test-YAML with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-Test-YAML finished"
popd
pushd ./ports/rhash
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: rhash with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building rhash finished"
popd
pushd ./ports/rsync
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: rsync with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building rsync finished"
popd
pushd ./ports/ruby
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: ruby with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building ruby finished"
popd
pushd ./ports/socat
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: socat with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building socat finished"
popd
pushd ./ports/w3m
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: w3m with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building w3m finished"
popd
pushd ./ports/xz
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: xz with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building xz finished"
popd
pushd ./ports/yasm
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: yasm with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building yasm finished"
popd
pushd ./ports/colordiff
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: colordiff with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building colordiff finished"
popd
pushd ./ports/libarchive
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: libarchive with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building libarchive finished"
popd
pushd ./ports/man-db
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: man-db with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building man-db finished"
popd
pushd ./ports/nghttp2
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: nghttp2 with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building nghttp2 finished"
popd
pushd ./ports/perl-IO-Socket-SSL
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-IO-Socket-SSL with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-IO-Socket-SSL finished"
popd
pushd ./ports/perl-libwww
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-libwww with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-libwww finished"
popd
pushd ./ports/python
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: python with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building python finished"
popd
pushd ./ports/squashfs-tools
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: squashfs-tools with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building squashfs-tools finished"
popd
pushd ./ports/tmux
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: tmux with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building tmux finished"
popd
pushd ./ports/xdelta3
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: xdelta3 with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building xdelta3 finished"
popd
pushd ./ports/file
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: file with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building file finished"
popd
pushd ./ports/git-filter-repo
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: git-filter-repo with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building git-filter-repo finished"
popd
pushd ./ports/gtest
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: gtest with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building gtest finished"
popd
pushd ./ports/heimdal
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: heimdal with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building heimdal finished"
popd
pushd ./ports/libssh
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: libssh with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building libssh finished"
popd
pushd ./ports/man2html
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: man2html with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building man2html finished"
popd
pushd ./ports/perl-LWP-Protocol-https
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-LWP-Protocol-https with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-LWP-Protocol-https finished"
popd
pushd ./ports/perl-Net-SMTP-SSL
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-Net-SMTP-SSL with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-Net-SMTP-SSL finished"
popd
pushd ./ports/python-flit-core
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: python-flit-core with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building python-flit-core finished"
popd
pushd ./ports/python-setuptools
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: python-setuptools with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building python-setuptools finished"
popd
pushd ./ports/re2c
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: re2c with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building re2c finished"
popd
pushd ./ports/vim
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: vim with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building vim finished"
popd
pushd ./ports/cvs
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: cvs with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building cvs finished"
popd
pushd ./ports/editorconfig-vim
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: editorconfig-vim with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building editorconfig-vim finished"
popd
pushd ./ports/libtirpc
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: libtirpc with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building libtirpc finished"
popd
pushd ./ports/ninja
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: ninja with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building ninja finished"
popd
pushd ./ports/openssh
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: openssh with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building openssh finished"
popd
pushd ./ports/python-installer
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: python-installer with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building python-installer finished"
popd
pushd ./ports/tmate
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: tmate with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building tmate finished"
popd
pushd ./ports/python-build
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: python-build with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building python-build finished"
popd
pushd ./ports/python-packaging
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: python-packaging with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building python-packaging finished"
popd
pushd ./ports/python-pyparsing
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: python-pyparsing with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building python-pyparsing finished"
popd
pushd ./ports/python-pyproject-hooks
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: python-pyproject-hooks with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building python-pyproject-hooks finished"
popd
pushd ./ports/ansible
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: ansible with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building ansible finished"
popd
pushd ./ports/ansible-core
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: ansible-core with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building ansible-core finished"
popd
pushd ./ports/asciidoc
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: asciidoc with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building asciidoc finished"
popd
pushd ./ports/cython
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: cython with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building cython finished"
popd
pushd ./ports/gi-docgen
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: gi-docgen with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building gi-docgen finished"
popd
pushd ./ports/gyp
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: gyp with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building gyp finished"
popd
pushd ./ports/meson
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: meson with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building meson finished"
popd
pushd ./ports/namcap
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: namcap with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building namcap finished"
popd
pushd ./ports/python-appdirs
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: python-appdirs with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building python-appdirs finished"
popd
pushd ./ports/python-babel
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: python-babel with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building python-babel finished"
popd
pushd ./ports/python-beaker
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: python-beaker with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building python-beaker finished"
popd
pushd ./ports/python-brotli
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: python-brotli with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building python-brotli finished"
popd
pushd ./ports/python-calver
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: python-calver with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building python-calver finished"
popd
pushd ./ports/python-certifi
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: python-certifi with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building python-certifi finished"
popd
pushd ./ports/python-cffi
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: python-cffi with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building python-cffi finished"
popd
pushd ./ports/python-charset-normalizer
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: python-charset-normalizer with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building python-charset-normalizer finished"
popd
pushd ./ports/python-configobj
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: python-configobj with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building python-configobj finished"
popd
pushd ./ports/python-docutils
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: python-docutils with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building python-docutils finished"
popd
pushd ./ports/python-editables
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: python-editables with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building python-editables finished"
popd
pushd ./ports/python-fastimport
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: python-fastimport with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building python-fastimport finished"
popd
pushd ./ports/python-hatch-fancy-pypi-readme
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: python-hatch-fancy-pypi-readme with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building python-hatch-fancy-pypi-readme finished"
popd
pushd ./ports/python-hatch-vcs
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: python-hatch-vcs with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building python-hatch-vcs finished"
popd
pushd ./ports/python-hatchling
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: python-hatchling with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building python-hatchling finished"
popd
pushd ./ports/python-idna
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: python-idna with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building python-idna finished"
popd
pushd ./ports/python-imagesize
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: python-imagesize with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building python-imagesize finished"
popd
pushd ./ports/python-jinja
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: python-jinja with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building python-jinja finished"
popd
pushd ./ports/python-mako
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: python-mako with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building python-mako finished"
popd
pushd ./ports/python-mallard-ducktype
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: python-mallard-ducktype with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building python-mallard-ducktype finished"
popd
pushd ./ports/python-markdown
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: python-markdown with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building python-markdown finished"
popd
pushd ./ports/python-markupsafe
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: python-markupsafe with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building python-markupsafe finished"
popd
pushd ./ports/python-more-itertools
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: python-more-itertools with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building python-more-itertools finished"
popd
pushd ./ports/python-pathspec
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: python-pathspec with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building python-pathspec finished"
popd
pushd ./ports/python-patiencediff
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: python-patiencediff with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building python-patiencediff finished"
popd
pushd ./ports/python-pip
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: python-pip with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building python-pip finished"
popd
pushd ./ports/python-poetry-core
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: python-poetry-core with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building python-poetry-core finished"
popd
pushd ./ports/python-py3c
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: python-py3c with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building python-py3c finished"
popd
pushd ./ports/python-pycparser
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: python-pycparser with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building python-pycparser finished"
popd
pushd ./ports/python-requests
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: python-requests with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building python-requests finished"
popd
pushd ./ports/python-resolvelib
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: python-resolvelib with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building python-resolvelib finished"
popd
pushd ./ports/python-roman-numerals
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: python-roman-numerals with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building python-roman-numerals finished"
popd
pushd ./ports/python-semantic-version
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: python-semantic-version with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building python-semantic-version finished"
popd
pushd ./ports/python-setuptools-scm
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: python-setuptools-scm with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building python-setuptools-scm finished"
popd
pushd ./ports/python-six
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: python-six with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building python-six finished"
popd
pushd ./ports/python-smartypants
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: python-smartypants with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building python-smartypants finished"
popd
pushd ./ports/python-snowballstemmer
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: python-snowballstemmer with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building python-snowballstemmer finished"
popd
pushd ./ports/python-sphinx
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: python-sphinx with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building python-sphinx finished"
popd
pushd ./ports/python-sphinx-alabaster-theme
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: python-sphinx-alabaster-theme with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building python-sphinx-alabaster-theme finished"
popd
pushd ./ports/python-sphinxcontrib-applehelp
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: python-sphinxcontrib-applehelp with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building python-sphinxcontrib-applehelp finished"
popd
pushd ./ports/python-sphinxcontrib-devhelp
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: python-sphinxcontrib-devhelp with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building python-sphinxcontrib-devhelp finished"
popd
pushd ./ports/python-sphinxcontrib-htmlhelp
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: python-sphinxcontrib-htmlhelp with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building python-sphinxcontrib-htmlhelp finished"
popd
pushd ./ports/python-sphinxcontrib-jsmath
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: python-sphinxcontrib-jsmath with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building python-sphinxcontrib-jsmath finished"
popd
pushd ./ports/python-sphinxcontrib-qthelp
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: python-sphinxcontrib-qthelp with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building python-sphinxcontrib-qthelp finished"
popd
pushd ./ports/python-sphinxcontrib-serializinghtml
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: python-sphinxcontrib-serializinghtml with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building python-sphinxcontrib-serializinghtml finished"
popd
pushd ./ports/python-typing_extensions
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: python-typing_extensions with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building python-typing_extensions finished"
popd
pushd ./ports/python-wcwidth
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: python-wcwidth with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building python-wcwidth finished"
popd
pushd ./ports/python-zstandard
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: python-zstandard with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building python-zstandard finished"
popd
pushd ./ports/scons
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: scons with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building scons finished"
popd
pushd ./ports/txt2tags
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: txt2tags with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building txt2tags finished"
popd
pushd ./ports/breezy
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: breezy with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building breezy finished"
popd
pushd ./ports/ca-certificates
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: ca-certificates with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building ca-certificates finished"
popd
pushd ./ports/grml-zsh-config
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: grml-zsh-config with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building grml-zsh-config finished"
popd
pushd ./ports/mercurial
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: mercurial with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building mercurial finished"
popd
pushd ./ports/mm-common
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: mm-common with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building mm-common finished"
popd
pushd ./ports/pkgconf
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: pkgconf with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building pkgconf finished"
popd
pushd ./ports/python-attrs
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: python-attrs with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building python-attrs finished"
popd
pushd ./ports/python-colorama
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: python-colorama with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building python-colorama finished"
popd
pushd ./ports/python-iniconfig
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: python-iniconfig with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building python-iniconfig finished"
popd
pushd ./ports/python-pacdb
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: python-pacdb with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building python-pacdb finished"
popd
pushd ./ports/python-pkgconfig
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: python-pkgconfig with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building python-pkgconfig finished"
popd
pushd ./ports/python-pluggy
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: python-pluggy with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building python-pluggy finished"
popd
pushd ./ports/python-pygments
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: python-pygments with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building python-pygments finished"
popd
pushd ./ports/python-pytest
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: python-pytest with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building python-pytest finished"
popd
pushd ./ports/python-setuptools-rust
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: python-setuptools-rust with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building python-setuptools-rust finished"
popd
pushd ./ports/python-trove-classifiers
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: python-trove-classifiers with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building python-trove-classifiers finished"
popd
pushd ./ports/python-typogrify
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: python-typogrify with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building python-typogrify finished"
popd
pushd ./ports/python-urllib3
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: python-urllib3 with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building python-urllib3 finished"
popd
pushd ./ports/python-yaml
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: python-yaml with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building python-yaml finished"
popd
pushd ./ports/serf
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: serf with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building serf finished"
popd
pushd ./ports/tig
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: tig with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building tig finished"
popd
pushd ./ports/xorgproto
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: xorgproto with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building xorgproto finished"
popd
pushd ./ports/yelp-tools
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: yelp-tools with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building yelp-tools finished"
popd
pushd ./ports/yelp-xsl
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: yelp-xsl with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building yelp-xsl finished"
popd
pushd ./ports/ccache
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: ccache with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building ccache finished"
popd
pushd ./ports/cyrus-sasl
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: cyrus-sasl with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building cyrus-sasl finished"
popd
pushd ./ports/dtc
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: dtc with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building dtc finished"
popd
pushd ./ports/glib2
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: glib2 with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building glib2 finished"
popd
pushd ./ports/guile
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: guile with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building guile finished"
popd
pushd ./ports/jsoncpp
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: jsoncpp with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building jsoncpp finished"
popd
pushd ./ports/libgit2
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: libgit2 with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building libgit2 finished"
popd
pushd ./ports/libinih
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: libinih with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building libinih finished"
popd
pushd ./ports/llvm
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: llvm with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building llvm finished"
popd
pushd ./ports/lndir
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: lndir with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building lndir finished"
popd
pushd ./ports/maturin
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: maturin with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building maturin finished"
popd
pushd ./ports/nnn
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: nnn with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building nnn finished"
popd
pushd ./ports/openbsd-netcat
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: openbsd-netcat with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building openbsd-netcat finished"
popd
pushd ./ports/perl-Alien-Libxml2
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: perl-Alien-Libxml2 with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building perl-Alien-Libxml2 finished"
popd
pushd ./ports/python-fastbencode
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: python-fastbencode with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building python-fastbencode finished"
popd
pushd ./ports/python-lxml
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: python-lxml with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building python-lxml finished"
popd
pushd ./ports/autogen
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: autogen with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building autogen finished"
popd
pushd ./ports/cppdap
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: cppdap with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building cppdap finished"
popd
pushd ./ports/gdb
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: gdb with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building gdb finished"
popd
pushd ./ports/gtk-doc
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: gtk-doc with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building gtk-doc finished"
popd
pushd ./ports/guile-mqtt
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: guile-mqtt with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building guile-mqtt finished"
popd
pushd ./ports/mc
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: mc with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building mc finished"
popd
pushd ./ports/mingw-w64-cross-gcc
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: mingw-w64-cross-gcc with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building mingw-w64-cross-gcc finished"
popd
pushd ./ports/subversion
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: subversion with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building subversion finished"
popd
pushd ./ports/tio
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: tio with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building tio finished"
popd
pushd ./ports/znc
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: znc with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building znc finished"
popd
pushd ./ports/libidn
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: libidn with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building libidn finished"
popd
pushd ./ports/libidn2
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: libidn2 with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building libidn2 finished"
popd
pushd ./ports/libtasn1
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: libtasn1 with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building libtasn1 finished"
popd
pushd ./ports/mingw-w64-cross-compiler-rt
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: mingw-w64-cross-compiler-rt with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building mingw-w64-cross-compiler-rt finished"
popd
pushd ./ports/msys2-launcher
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: msys2-launcher with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building msys2-launcher finished"
popd
pushd ./ports/msys2-w32api-headers
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: msys2-w32api-headers with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building msys2-w32api-headers finished"
popd
pushd ./ports/msys2-w32api-runtime
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: msys2-w32api-runtime with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building msys2-w32api-runtime finished"
popd
pushd ./ports/util-linux
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: util-linux with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building util-linux finished"
popd
pushd ./ports/winpty
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: winpty with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building winpty finished"
popd
pushd ./ports/git-flow
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: git-flow with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building git-flow finished"
popd
pushd ./ports/libpsl
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: libpsl with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building libpsl finished"
popd
pushd ./ports/lynx
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: lynx with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building lynx finished"
popd
pushd ./ports/neomutt
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: neomutt with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building neomutt finished"
popd
pushd ./ports/p11-kit
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: p11-kit with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building p11-kit finished"
popd
pushd ./ports/whois
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: whois with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building whois finished"
popd
pushd ./ports/curl
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: curl with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building curl finished"
popd
pushd ./ports/gnutls
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: gnutls with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building gnutls finished"
popd
pushd ./ports/cargo-c
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: cargo-c with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building cargo-c finished"
popd
pushd ./ports/elinks
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: elinks with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building elinks finished"
popd
pushd ./ports/emacs
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: emacs with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building emacs finished"
popd
pushd ./ports/gnupg
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: gnupg with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building gnupg finished"
popd
pushd ./ports/lftp
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: lftp with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building lftp finished"
popd
pushd ./ports/pacman
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: pacman with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building pacman finished"
popd
pushd ./ports/pacman-contrib
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: pacman-contrib with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building pacman-contrib finished"
popd
pushd ./ports/pacutils
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: pacutils with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building pacutils finished"
popd
pushd ./ports/pkgfile
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: pkgfile with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building pkgfile finished"
popd
pushd ./ports/rust
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: rust with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building rust finished"
popd
pushd ./ports/task
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: task with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building task finished"
popd
pushd ./ports/u-boot-tools
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: u-boot-tools with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building u-boot-tools finished"
popd
pushd ./ports/wget
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: wget with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building wget finished"
popd
pushd ./ports/base
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: base with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building base finished"
popd
pushd ./ports/cargo-edit
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: cargo-edit with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building cargo-edit finished"
popd
pushd ./ports/cmake
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: cmake with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building cmake finished"
popd
pushd ./ports/crosstool-ng
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: crosstool-ng with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building crosstool-ng finished"
popd
pushd ./ports/fish
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: fish with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building fish finished"
popd
pushd ./ports/irssi
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: irssi with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building irssi finished"
popd
pushd ./ports/just
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: just with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building just finished"
popd
pushd ./ports/mutt
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: mutt with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building mutt finished"
popd
pushd ./ports/python-cryptography
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: python-cryptography with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building python-cryptography finished"
popd
pushd ./ports/python-dulwich
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: python-dulwich with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building python-dulwich finished"
popd
pushd ./ports/python-pyalpm
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: python-pyalpm with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building python-pyalpm finished"
popd
pushd ./ports/remake
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: remake with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building remake finished"
popd
pushd ./ports/uutils-coreutils
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: uutils-coreutils with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building uutils-coreutils finished"
popd
pushd ./ports/uv
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: uv with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building uv finished"
popd
pushd ./ports/base-devel
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: base-devel with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building base-devel finished"
popd
pushd ./ports/fisher
makepkg --cleanbuild --syncdeps --force --noconfirm --nocheck
# makepkg --nobuild --cleanbuild
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error for pkgbase: fisher with retcode:$retVal "
    exit $retVal
fi
echo "All packages:"
find -name "*.pkg.tar.zst"
echo "Packages to install:"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst"
find -name "*-devel*.pkg.tar.zst" -or -name "*llvm*.pkg.tar.zst" | xargs -I ARG tar xf ARG -C /
find -name "*.pkg.tar.zst" | xargs -I ARG mv -f ARG ../../dist/
echo "Building fisher finished"
popd
