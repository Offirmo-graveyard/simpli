#! /bin/bash

## simpli : SIMple Provisioning Library


## Are we running as root ?
## http://stackoverflow.com/questions/18215973/how-to-check-if-running-as-root-in-a-bash-script
if [[ $EUID -eq 0 ]]; then
	## we are sudo
	SIMPLI_EXEC_MODE="sudo"
else
	SIMPLI_EXEC_MODE="user"
fi


## WARNING Those dirs must be mirrored in index.sh

## place where we'll put stuff installed with sudo
export SUDO_WORKING_AREA_PATH="/work"
## and its subdirs
export SUDO_TEMP_AREA_PATH="$SUDO_WORKING_AREA_PATH/temp"
export SUDO_BIN_AREA_PATH="$SUDO_WORKING_AREA_PATH/bin"
## and the environment file, to be sourced to get env vars
export SUDO_ENV_FILE="$SUDO_BIN_AREA_PATH/environment.sh"


## place where we'll put stuff installed in user mode
## Warning : this may have to be expanded.
export USER_WORKING_AREA_PATH=`OSL_FILE_realpath "~/work"`
## and its subdirs
export USER_TEMP_AREA_PATH="$USER_WORKING_AREA_PATH/temp"
export USER_BIN_AREA_PATH="$USER_WORKING_AREA_PATH/bin"
export USER_SRC_AREA_PATH="$USER_WORKING_AREA_PATH/src"
export USER_GIT_AREA_PATH="$USER_SRC_AREA_PATH/git"
## and the environment file, to be sourced to get env vars
export USER_ENV_FILE="$USER_BIN_AREA_PATH/environment.sh"


## Summary
## id alignment max size and help
export SUMMARY_ALIGN="                       "
## for non standard installs
export summary_report_complement=""
