mkdir -p build-cache/stage1
source scripts/sh/check-bootstrap.sh
if [[ "$MSYS_CLEAN_TYPE" == "only" ]]; then
  echo "Do cleanup only, do not init"
else
  sh scripts/sh/bootstrap-init-stage1.sh
fi
pushd build-install
sh perl-create-syms-for-pkg.sh
popd
