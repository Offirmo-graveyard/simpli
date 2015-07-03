#! /bin/bash

## Test of SIMPLI provisionning module

source ../../../../test/test_common.sh "webstorm module provisionning - manual"

## load simpli which will do apt-get update
export SIMPLI_SKIP_APT_UPDATE=1
export SIMPLI_SKIP_APT_UPGRADE=1
source "${SIMPLI_DIR}/bin/index.sh"
OSL_EXIT_abort_execution_if_bad_retcode $?

## provision our stuff
require offirmo/webstorm
OSL_EXIT_abort_execution_if_bad_retcode $?

## display a summary (user-mode only)
print_provisionning_summary

echo
