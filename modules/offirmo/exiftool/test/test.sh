#! /bin/bash

## Test of SIMPLI provisionning module
# export OSL_debug_activated=true
# export SIMPLI_SKIP_APT_UPDATE=true
# export SIMPLI_SKIP_APT_UPGRADE=true

source ../../../../test/test_common.sh "exiftool module provisionning - unmanaged mode"

function install_apt_sources() {
	do_nothing=1
}

## now load simpli which will do apt-get update
source "${SIMPLI_DIR}/bin/index.sh"
OSL_EXIT_abort_execution_if_bad_retcode $?

## provision our stuff
require offirmo/exiftool
OSL_EXIT_abort_execution_if_bad_retcode $?

## display a summary (user-mode only)
print_provisionning_summary

echo
