#! /bin/bash

## simpli : SIMple Provisioning Library


## returns 0 if OK, exits if not (too important)
ensure_module_definition_loaded()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"
	local module_id="$1"

	if [[ ${module_load_statuses["$module_id"]} != true ]]; then
		load_module_definition "$module_id"
		OSL_EXIT_abort_execution_if_bad_retcode $? "Couldn't load '$module_id' !"
		module_load_statuses[$module_id]=true
	else
		SIMPLI_log_module_defs "'$module_id' definitions already loaded."
	fi
	return 0
}


## returns 0 if OK, exits if not (too important)
load_module_definition()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"
	local module_id="$1"

	## first try in current path
	## then if error, try in standard modules dir
	if [[ -f "$module_id.sh" ]]; then
		source "$module_id.sh"
	else
		source "$SIMPLI_DIR/modules/$module_id.sh"
	fi
	OSL_EXIT_abort_execution_if_bad_retcode $? "Couldn't load '$module_id.sh' !"

	validate_module_definition "$module_id"
	OSL_EXIT_abort_execution_if_bad_retcode $? "'$module_id' definition is invalid. Please check !"

	SIMPLI_log_module_defs "Definition file successfully loaded for '$module_id'."
}


validate_module_definition()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"
	local module_id="$1"

	local function

	function=check_${module_id}_installed_sudo
	[[ `type -t $function` != "function" ]] && OSL_OUTPUT_display_error_message "Missing function $function !" && return 1

	function=ensure_${module_id}_installed_sudo
	[[ `type -t $function` != "function" ]] && OSL_OUTPUT_display_error_message "Missing function $function !" && return 1

	function=check_${module_id}_installed_user
	[[ `type -t $function` != "function" ]] && OSL_OUTPUT_display_error_message "Missing function $function !" && return 1

	function=ensure_${module_id}_installed_user
	[[ `type -t $function` != "function" ]] && OSL_OUTPUT_display_error_message "Missing function $function !" && return 1

	function=ensure_${module_id}_sourced
	[[ `type -t $function` != "function" ]] && OSL_OUTPUT_display_error_message "Missing function $function !" && return 1

	function=get_installed_${module_id}_summary
	[[ `type -t $function` != "function" ]] && OSL_OUTPUT_display_error_message "Missing function $function !" && return 1

	return 0
}

## return 0 if installed OK
test_module_installation_status()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"
	local module_id="$1"
	local module_version="$2"

	local fnname=check_${module_id}_installed_${SIMPLI_EXEC_MODE}
	$fnname "$module_version"
	return $?
}


## print module informations
## return 0 if OK
get_installed_module_summary()
{
	local module_id="$1"
	local module_version="$2"

	local fnname=get_installed_${module_id}_summary
	echo "`$fnname "$module_version"`"
	return $?
}


## returns 0 if OK
install_module()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"
	local module_id="$1"
	local module_version="$2"
	OSL_OUTPUT_notify "* Installing module '$module_id'..."

	local fnname=ensure_${module_id}_installed_${SIMPLI_EXEC_MODE}
	$fnname "$module_version"
	OSL_EXIT_abort_execution_if_bad_retcode $? "Error installing '$module_id' !"
	OSL_OUTPUT_display_success_message "'$module_id' installed successfully."

	return 0
}


## prints info on all installed modules
print_provisionning_summary()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"

	if [[ $SIMPLI_EXEC_MODE != "user" ]]; then
		OSL_OUTPUT_warn "Provisionning isn't finished ! If they weren't any error, now please continue it in user mode."
	else
		OSL_OUTPUT_warn "Provisionning finished ! If they weren't any error, you can review installed stuff here :"

		echo -e $OSL_OUTPUT_STYLE_SUCCESS

		OSL_CAPABILITIES_ensure_current_linux_distribution_detected
		echo -e "OS${SUMMARY_ALIGN:2} $OSL_CAPABILITIES_OSSTR"

		## -e for newlines and color codes
		echo -en "$summary_report_complement"

		for id in "${!module_load_statuses[@]}"; do
			echo -n "$id"
			echo -n "${SUMMARY_ALIGN:${#id}} "
			echo "`get_installed_module_summary "$id"`"
		done

		echo -en "$OSL_OUTPUT_STYLE_DEFAULT"
	fi

}
