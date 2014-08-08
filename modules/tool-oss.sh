## Shell provision script for
## Open Search Server

SIMPLI_log_source `basename "$BASH_SOURCE"`

## prerequisites :
require tool-jdk '~7'


check_tool-oss_installed_sudo()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"
	OSL_OUTPUT_warn_not_implemented "[$FUNCNAME()]"
	## nothing
	return 1
}
ensure_tool-oss_installed_sudo()
{
	OSL_debug "[$FUNCNAME($*)]"
	OSL_OUTPUT_warn_not_implemented "[$FUNCNAME()]"
	## nothing
	return 1
}

check_tool-oss_installed_user()
{
	OSL_debug "[$FUNCNAME($*)]"
	OSL_OUTPUT_warn_not_implemented "[$FUNCNAME()]"
	## nothing
	return 1
}
ensure_tool-oss_installed_user()
{
	OSL_debug "[$FUNCNAME($*)]"
	OSL_OUTPUT_warn_not_implemented "[$FUNCNAME()]"
	## nothing
	return 1
}

ensure_tool-oss_sourced()
{
	#OSL_debug "[$FUNCNAME($*)]"
	OSL_OUTPUT_warn_not_implemented "[$FUNCNAME()]"
	## nothing
	return 1
}

## output one-line info (version, build, etc.)
get_installed_tool-oss_summary()
{
	#OSL_debug "[$FUNCNAME($*)]"
	ensure_tool-oss_sourced
	OSL_OUTPUT_warn_not_implemented "[$FUNCNAME()]"
	return 1
}

return 0
