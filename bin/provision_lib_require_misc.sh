#! /bin/bash

## simpli : SIMple Provisioning Library

require_defined_variable()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"
	local varname="$*"
	[[ -z "$varname" ]] && OSL_OUTPUT_display_error_message "required variable not provided !" && return 1

	eval value='$'$varname
	if [[ -n "$value" ]]; then
		## ok, not empty

		## prepare summary
		#local summary_id="\$${varname}"
		#summary_report_complement="${summary_report_complement}$summary_id${SUMMARY_ALIGN:${#summary_id}} $value\n"

		return 0
	else
		OSL_EXIT_abort_execution_with_message "required variable $varname is missing. Please define it !"
	fi

	return 1
}

require_defined_variable_or_fallback_to_provided_default()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"
	local varname="$1"
	local default_value="$2" ## if any
	[[ -z "$varname" ]] && OSL_EXIT_abort_execution_with_message "required variable not provided !"
	[[ -z "$default_value" ]] && OSL_EXIT_abort_execution_with_message "required variable default value not provided !"

	eval value='$'$varname
	if [[ -n "$value" ]]; then
		## ok, not empty
		do_nothing=1
	else
		# empty, let's define it
		eval export $varname=$default_value
		eval value='$'$varname
		echo "set $varname to $value"
	fi

	## prepare summary
	#local summary_id="$$varname"
	#summary_report_complement="${summary_report_complement}$summary_id${SUMMARY_ALIGN:${#summary_id}} $value\n"

	return 0
}


## ensure a dir is present
## /home/xyz dirs are created in user mode only
## other dirs are created in sudo mode
require_directory()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"
	local dir="`OSL_FILE_abspath "$*"`"

	## is it a user dir ?
	local dir_owner="sudo" ## so far
	OSL_FILE_find_common_path "$dir" "/home"
	[[ "$return_value" = "/home" ]] && dir_owner="user"

	## prepare summary (nevermind if mkdir failure)
	local summary_id="$dir_owner dir"
	summary_report_complement="${summary_report_complement}$summary_id${SUMMARY_ALIGN:${#summary_id}} $dir\n"

	## already exists ?
	[[ -d "$dir" ]] && return 0;

	if [[ $dir_owner = "user" ]]; then
		## dir is local to user
		## create if we are in user mode
		if [[ $SIMPLI_EXEC_MODE = "user" ]]; then
			#echo "creating user dir..."
			mkdir -p "$dir"
			OSL_EXIT_abort_execution_if_bad_retcode $? "Couldn't create user dir '$dir' !"
		fi
	else
		## dir is not local to user
		## create if we are in sudo mode
		## or expect it to exist else
		if [[ $SIMPLI_EXEC_MODE = "sudo" ]]; then
			#echo "creating sudo dir..."
			mkdir -p "$dir"
			OSL_EXIT_abort_execution_if_bad_retcode $? "Couldn't create sudo dir '$dir' !"
		else
			## should have been created already !
			OSL_EXIT_abort_execution_with_message "Directory '$dir' is missing. Did you provision in sudo mode first ?"
		fi
	fi

	return 0
}


## ensure a file is present (will be created blank)
## /home/xyz files are created in user mode only
## other files are created in sudo mode
require_file()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"
	local target_file="`OSL_FILE_abspath "$*"`"

	## is it a user dir ?
	local file_owner="sudo" ## so far
	OSL_FILE_find_common_path "$target_file" "/home"
	[[ "$return_value" = "/home" ]] && file_owner="user"

	## prepare summary (nevermind if mkdir failure)
	local summary_id="$file_owner file"
	summary_report_complement="${summary_report_complement}$summary_id${SUMMARY_ALIGN:${#summary_id}} $target_file\n"

	## already exists ?
	[[ -f "$target_file" ]] && return 0;

	if [[ $file_owner = "user" ]]; then
		## file is local to user
		## create if we are in user mode
		if [[ $SIMPLI_EXEC_MODE = "user" ]]; then
			touch "$target_file"
			OSL_EXIT_abort_execution_if_bad_retcode $? "Couldn't create user file '$target_file' !"
		fi
	else
		## file is not local to user
		## create if we are in sudo mode
		## or expect it to exist else
		if [[ $SIMPLI_EXEC_MODE = "sudo" ]]; then
			touch "$target_file"
			OSL_EXIT_abort_execution_if_bad_retcode $? "Couldn't create sudo file '$target_file' !"
		else
			## should have been created already !
			OSL_EXIT_abort_execution_with_message "File '$target_file' is missing. Did you provision in sudo mode first ?"
		fi
	fi

	return 0
}


require_apt_packet()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"
	local packet_id="$1"

	local var install_status=`OSL_CAPABILITIES_APT_get_packet_status $packet_id`
	if [[ $install_status = 'Installed' ]]; then
		OSL_debug "* requiring packet '$packet_id' : already installed."
	else
		if [[ $SIMPLI_EXEC_MODE != "sudo" ]]; then
			OSL_EXIT_abort_execution_with_message "apt packet '$packet_id' is missing, should have been installed as sudo !"
		else
			OSL_OUTPUT_notify "* installing apt packet '$packet_id'..."
			apt-get install --yes $packet_id
			OSL_EXIT_abort_execution_if_bad_retcode $? "Couldn't install apt-packet '$packet_id' !"
		fi
	fi
	return 0
}


require_env_line()
{
	echo "require_env_line"
	SIMPLI_log_call "[$FUNCNAME($*)]"
	local line="$*"

	local target_file=$SUDO_ENV_FILE  ## so far
	[[ $SIMPLI_EXEC_MODE != "sudo" ]] && target_file=$USER_ENV_FILE

	OSL_FILE_ensure_line_is_present_in_file "$line" "$target_file"

	return 0
}
