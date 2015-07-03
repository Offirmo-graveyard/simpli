#! /bin/bash

## Test of SIMPLI provisionning module
# export OSL_debug_activated=true
# export INITIAL_APT_BOOTSTRAP_DONE=true

source ../../../../test/test_common.sh "docker module provisionning - apt mode"

function install_apt_sources() {
	## add special apt sources here before loading simpli
	. "$TEST_DIR/../docker.apt.prepare.sh"
	OSL_EXIT_abort_execution_if_bad_retcode $? "Couldn't install apt sources"
	OSL_OUTPUT_display_success_message "* apt sources installed OK"
}

## now load simpli which will do apt-get update
source "${SIMPLI_DIR}/bin/index.sh"
OSL_EXIT_abort_execution_if_bad_retcode $?

## provision our stuff
require offirmo/docker
OSL_EXIT_abort_execution_if_bad_retcode $?

## display a summary (user-mode only)
print_provisionning_summary

echo
