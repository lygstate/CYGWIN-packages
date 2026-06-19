export MSYS_BUILD_PKGSUMS=disabled
# export MSYS_CLEAN_TYPE=enabled
export MSYS_BOOTSTRAP_STAGE=
source scripts/sh/check-bootstrap.sh

sh scripts/sh/single.sh msys2-runtime

export MSYS_BUILD_PKGSUMS=disabled
# export MSYS_CLEAN_TYPE=enabled
export MSYS_BOOTSTRAP_STAGE=stage_origin_hook
source scripts/sh/check-bootstrap.sh

sh scripts/sh/single.sh msys2-runtime

do_build() {
  sh scripts/sh/stage-hook.sh >build-stage-hook.txt 2>&1
}
