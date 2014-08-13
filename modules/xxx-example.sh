## Shell provision script for
## (some tool)

SIMPLI_log_source `basename "$BASH_SOURCE"`

## prerequisites :
## (none)


check_env-working_area_installed_sudo()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"
	OSL_OUTPUT_warn_not_implemented "[$FUNCNAME()]"
	## nothing
	return 1
}
ensure_env-working_area_installed_sudo()
{
	OSL_debug "[$FUNCNAME($*)]"
	OSL_OUTPUT_warn_not_implemented "[$FUNCNAME()]"
	## nothing
	return 1
}

check_env-working_area_installed_user()
{
	OSL_debug "[$FUNCNAME($*)]"
	OSL_OUTPUT_warn_not_implemented "[$FUNCNAME()]"
	## nothing
	return 1
}
ensure_env-working_area_installed_user()
{
	OSL_debug "[$FUNCNAME($*)]"
	OSL_OUTPUT_warn_not_implemented "[$FUNCNAME()]"
	## nothing
	return 1
}

ensure_env-working_area_sourced()
{
	#OSL_debug "[$FUNCNAME($*)]"
	OSL_OUTPUT_warn_not_implemented "[$FUNCNAME()]"
	## nothing
	return 1
}

## output one-line info (version, build, etc.)
get_installed_env-working_area_summary()
{
	#OSL_debug "[$FUNCNAME($*)]"
	ensure_env-working_area_sourced
	OSL_OUTPUT_warn_not_implemented "[$FUNCNAME()]"
	return 1
}

return 0
