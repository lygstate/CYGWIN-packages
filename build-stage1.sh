currnent_script_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
cd "$currnent_script_dir"
node scripts/build-stage1.ts "$@"
ret=$?
return $ret 2>/dev/null || exit $ret
