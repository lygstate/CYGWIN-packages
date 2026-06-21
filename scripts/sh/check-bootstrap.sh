currnent_script_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/../.." &> /dev/null && pwd)
if [ -z "$currnent_script_dir" ]; then
  currnent_script_dir=$PWD
fi
source "${currnent_script_dir}/ports/msys2-runtime/check-bootstrap.sh"

msys_runtime_pkgver_command_str="export MSYS_BOOTSTRAP_STAGE=stage1_rt_origin;source ${currnent_script_dir}/ports/msys2-runtime/PKGBUILD; echo \$pkgver"
export MSYS_RUNTIME_PKGVER=`sh -c "$msys_runtime_pkgver_command_str"`
msys_runtime_pkgrel_command_str="export MSYS_BOOTSTRAP_STAGE=stage1_rt_origin;source ${currnent_script_dir}/ports/msys2-runtime/PKGBUILD; echo \$pkgrel"
export MSYS_RUNTIME_PKGREL=`sh -c "$msys_runtime_pkgrel_command_str"`
msys_runtime_hook_pkgrel_command_str="export MSYS_BOOTSTRAP_STAGE=stage1_rt_hook;source ${currnent_script_dir}/ports/msys2-runtime/PKGBUILD; echo \$pkgrel"
export MSYS_RUNTIME_HOOK_PKGREL=`sh -c "$msys_runtime_hook_pkgrel_command_str"`
export MSYS2_BOOTSTRAP_VER=6

libiconv_pkgver_command_str="export MSYS_BOOTSTRAP_STAGE=;source ${currnent_script_dir}/ports/libiconv/PKGBUILD; echo \$pkgver"
export LIBICONV_PKGVER=`sh -c "$libiconv_pkgver_command_str"`
libiconv_pkgrel_command_str="export MSYS_BOOTSTRAP_STAGE=;source ${currnent_script_dir}/ports/libiconv/PKGBUILD; echo \$pkgrel"
export LIBICONV_PKGREL=`sh -c "$libiconv_pkgrel_command_str"`

libtool_pkgver_command_str="export MSYS_BOOTSTRAP_STAGE=;source ${currnent_script_dir}/ports/libtool/PKGBUILD; echo \$pkgver"
export LIBTOOL_PKGVER=`sh -c "$libtool_pkgver_command_str"`
libtool_pkgrel_command_str="export MSYS_BOOTSTRAP_STAGE=;source ${currnent_script_dir}/ports/libtool/PKGBUILD; echo \$pkgrel"
export LIBTOOL_PKGREL=`sh -c "$libtool_pkgrel_command_str"`

meson_pkgver_command_str="export MSYS_BOOTSTRAP_STAGE=;source ${currnent_script_dir}/ports/meson/PKGBUILD; echo \$pkgver"
export MESON_PKGVER=`sh -c "$meson_pkgver_command_str"`
meson_pkgrel_command_str="export MSYS_BOOTSTRAP_STAGE=;source ${currnent_script_dir}/ports/meson/PKGBUILD; echo \$pkgrel"
export MESON_PKGREL=`sh -c "$meson_pkgrel_command_str"`

cmake_pkgver_command_str="export MSYS_BOOTSTRAP_STAGE=;source ${currnent_script_dir}/ports/cmake/PKGBUILD; echo \$pkgver"
export CMAKE_PKGVER=`sh -c "$cmake_pkgver_command_str"`
cmake_pkgrel_command_str="export MSYS_BOOTSTRAP_STAGE=;source ${currnent_script_dir}/ports/cmake/PKGBUILD; echo \$pkgrel"
export CMAKE_PKGREL=`sh -c "$cmake_pkgrel_command_str"`

scons_pkgver_command_str="export MSYS_BOOTSTRAP_STAGE=;source ${currnent_script_dir}/ports/scons/PKGBUILD; echo \$pkgver"
export SCONS_PKGVER=`sh -c "$scons_pkgver_command_str"`
scons_pkgrel_command_str="export MSYS_BOOTSTRAP_STAGE=;source ${currnent_script_dir}/ports/scons/PKGBUILD; echo \$pkgrel"
export SCONS_PKGREL=`sh -c "$scons_pkgrel_command_str"`

gcc_pkgver_command_str="export MSYS_BOOTSTRAP_STAGE=;source ${currnent_script_dir}/ports/gcc/PKGBUILD; echo \$pkgver"
export GCC_PKGVER=`sh -c "$gcc_pkgver_command_str"`
gcc_pkgrel_command_str="export MSYS_BOOTSTRAP_STAGE=;source ${currnent_script_dir}/ports/gcc/PKGBUILD; echo \$pkgrel"
export GCC_PKGREL=`sh -c "$gcc_pkgrel_command_str"`

binutils_pkgver_command_str="export MSYS_BOOTSTRAP_STAGE=;source ${currnent_script_dir}/ports/binutils/PKGBUILD; echo \$pkgver"
export BINUTILS_PKGVER=`sh -c "$binutils_pkgver_command_str"`
binutils_pkgrel_command_str="export MSYS_BOOTSTRAP_STAGE=;source ${currnent_script_dir}/ports/binutils/PKGBUILD; echo \$pkgrel"
export BINUTILS_PKGREL=`sh -c "$binutils_pkgrel_command_str"`

tcl_pkgver_command_str="export MSYS_BOOTSTRAP_STAGE=;source ${currnent_script_dir}/ports/tcl/PKGBUILD; echo \$pkgver"
export TCL_PKGVER=`sh -c "$tcl_pkgver_command_str"`
tcl_pkgrel_command_str="export MSYS_BOOTSTRAP_STAGE=;source ${currnent_script_dir}/ports/tcl/PKGBUILD; echo \$pkgrel"
export TCL_PKGREL=`sh -c "$tcl_pkgrel_command_str"`

perl_pkgver_command_str="export MSYS_BOOTSTRAP_STAGE=;source ${currnent_script_dir}/ports/perl/PKGBUILD; echo \$pkgver"
export PERL_PKGVER=`sh -c "$perl_pkgver_command_str"`
perl_pkgrel_command_str="export MSYS_BOOTSTRAP_STAGE=;source ${currnent_script_dir}/ports/perl/PKGBUILD; echo \$pkgrel"
export PERL_PKGREL=`sh -c "$perl_pkgrel_command_str"`
