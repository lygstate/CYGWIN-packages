export MSYS_BUILD_PKGSUMS=disabled
export MSYS_BOOTSTRAP_STAGE=
source scripts/sh/check-bootstrap.sh
export pkg_root_dir="${pkg_root_dir:-$PWD}"
new_dir=msys2-runtime
source scripts/sh/single.sh

export MSYS_BUILD_PKGSUMS=disabled
export MSYS_BOOTSTRAP_STAGE=stage1_rt_hook
source scripts/sh/check-bootstrap.sh
new_dir=msys2-runtime
source scripts/sh/single.sh
