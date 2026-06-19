currnent_script_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
source "${currnent_script_dir}/scripts/sh/check-bootstrap.sh"
