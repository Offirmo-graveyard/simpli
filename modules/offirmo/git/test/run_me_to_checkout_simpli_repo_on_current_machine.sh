#! /bin/bash

## Test of SIMPLI provisionning module
source "../../../test/test_common.sh" "git, utility to checkout a repo"


## add special apt sources here before loading simpli
## (not needed)

## now load simpli which will do apt-get update
source "${SIMPLI_DIR}/bin/index.sh"
OSL_EXIT_abort_execution_if_bad_retcode $?

## provision our stuff
require offirmo/git
OSL_EXIT_abort_execution_if_bad_retcode $?

require_git_repo git@github.com:Offirmo/simpli.git "foo"
OSL_EXIT_abort_execution_if_bad_retcode $?

## display a summary (user-mode only)
print_provisionning_summary

echo
