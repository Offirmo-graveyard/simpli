#! /bin/bash

## Test of SIMPLI provisionning module

echo ""
echo "### Testing SIMPLI module : $1 ###"

TEST_DIR="`dirname "${BASH_SOURCE[1]}"`"
SIMPLI_DIR="`dirname "$BASH_SOURCE"`/.."

## Load OSL shell lib
embedded_osl_bootstrap_script="$SIMPLI_DIR/contrib/offirmo-shell-lib/bin/osl_lib_bootstrap.sh"
source "$embedded_osl_bootstrap_script" "$embedded_osl_bootstrap_script"
[[ $? -ne 0 ]] && exit 1
## OSL should now be available, source it
#OSL_debug_activated=true
source osl_lib_init.sh
source osl_lib_output.sh
source osl_lib_exit.sh

if [[ `id -u` -eq 0 ]]; then
	OSL_OUTPUT_warn "script run as root"
else
	OSL_OUTPUT_display_success_message "* script run as user"
fi
