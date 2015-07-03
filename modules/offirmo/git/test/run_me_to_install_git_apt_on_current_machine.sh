#! /bin/bash

## Test of SIMPLI provisionning module

echo ""
echo "######################################################"
echo "# Testing SIMPLI git module provisionning - apt mode #"
echo "######################################################"

TEST_DIR="`dirname "$BASH_SOURCE"`"
SIMPLI_DIR="$TEST_DIR/../../.."

## Load OSL shell lib
embedded_osl_bootstrap_script="$SIMPLI_DIR/contrib/offirmo-shell-lib/bin/osl_lib_bootstrap.sh"
source "$embedded_osl_bootstrap_script" "$embedded_osl_bootstrap_script"
[[ $? -ne 0 ]] && exit 1
## OSL should now be available, source it
#OSL_debug_activated=true
source osl_lib_init.sh
#source osl_lib_debug.sh
source osl_lib_output.sh
source osl_lib_exit.sh


if [[ `id -u` -eq 0 ]]; then
	OSL_OUTPUT_warn "script run as root"
else
	OSL_OUTPUT_display_success_message "* script run as user"
fi

## add special apt sources here before loading simpli
## (not needed)

## load simpli which will do apt-get update
export SIMPLI_SKIP_APT_UPDATE=1
export SIMPLI_SKIP_APT_UPGRADE=1
source "${SIMPLI_DIR}/bin/index.sh"
OSL_EXIT_abort_execution_if_bad_retcode $?

## provision our stuff
require offirmo/git
OSL_EXIT_abort_execution_if_bad_retcode $?

## display a summary (user-mode only)
print_provisionning_summary

echo
