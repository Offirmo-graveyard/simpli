#! /bin/bash

## simpli : SIMple Provisioning Library
## Example : for use with Vagrant.
## by Offirmo <offirmo.net@gmail.com>
## Work In Progress

SIMPLI_DIR=`dirname "$BASH_SOURCE"`/..
## note that dir may be relative. Ok for now until we load OSL

## We use the OSL shell lib. Load it.
## To ease shipment, we have an embedded OSL copy
## but we'll use system one if it's more recent.
## There is a technique for that (cf. OSL doc)
embedded_osl_bootstrap_script=$SIMPLI_DIR/contrib/offirmo-shell-lib/bin/osl_lib_bootstrap.sh
source "$embedded_osl_bootstrap_script" "$embedded_osl_bootstrap_script"

## OSL should now be available, source it
source osl_lib_init.sh
source osl_lib_debug.sh
source osl_lib_output.sh
source osl_lib_string.sh
source osl_lib_rsrc.sh
source osl_lib_version.sh
source osl_lib_exit.sh
source osl_lib_capabilities.sh
source osl_lib_archive.sh
source osl_lib_pathvar.sh
source osl_lib_file.sh

## enhance $SIMPLI_DIR
## relative was OK so far but need absolute
SIMPLI_DIR=`OSL_FILE_abspath $SIMPLI_DIR`

## declare shared global variables
## (arrays must be declared here and this way to be global)
declare -A module_load_statuses
declare -A module_install_statuses
declare -A apt_packet_install_statuses

## include provisionning primitives
source $SIMPLI_DIR/bin/provision_inc_env.sh
source $SIMPLI_DIR/bin/provision_lib_debug.sh
OSL_OUTPUT_display_success_message "*** $SIMPLI_NAME ***"
OSL_OUTPUT_notify "v$SIMPLI_VERSION ($SIMPLI_STAMP)"
source $SIMPLI_DIR/bin/provision_inc_globals.sh
OSL_OUTPUT_notify "Running as $SIMPLI_EXEC_MODE"
OSL_OUTPUT_notify "Lib root is $SIMPLI_DIR"
source $SIMPLI_DIR/bin/provision_lib_modules.sh
source $SIMPLI_DIR/bin/provision_lib_require.sh
source $SIMPLI_DIR/bin/provision_lib_require_misc.sh

## Needed base
require_defined_variable "SUDO_WORKING_AREA_PATH"
require_directory       "$SUDO_WORKING_AREA_PATH"
require_defined_variable "SUDO_TEMP_AREA_PATH"
require_directory       "$SUDO_TEMP_AREA_PATH"
require_defined_variable "SUDO_BIN_AREA_PATH"
require_directory       "$SUDO_BIN_AREA_PATH"

require_defined_variable "USER_WORKING_AREA_PATH"
require_directory       "$USER_WORKING_AREA_PATH"
require_defined_variable "USER_TEMP_AREA_PATH"
require_directory       "$USER_TEMP_AREA_PATH"
require_defined_variable "USER_BIN_AREA_PATH"
require_directory       "$USER_BIN_AREA_PATH"
require_defined_variable "USER_SRC_AREA_PATH"
require_directory       "$USER_SRC_AREA_PATH"
require_defined_variable "USER_GIT_AREA_PATH"
require_directory       "$USER_GIT_AREA_PATH"

require_defined_variable "SUDO_ENV_FILE"
require_file            "$SUDO_ENV_FILE"
require_defined_variable "USER_ENV_FILE"
require_file            "$USER_ENV_FILE"

if [[ $SIMPLI_EXEC_MODE = "sudo" ]]; then
	echo "# `date`" > "$SUDO_ENV_FILE"
else
	echo "# `date`" > "$USER_ENV_FILE"
fi

## keep up to date and lean
if [[ $SIMPLI_EXEC_MODE = "sudo" ]]; then
	apt-get update
	OSL_EXIT_abort_execution_if_bad_retcode $? "Error updating apt !"
	## keep our machine up to date
	apt-get upgrade --yes
	## keep our machine clean and lean
	apt-get autoremove --yes
fi


# dpkg-reconfigure tzdata ?
