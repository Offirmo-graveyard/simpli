## Shell provision script for :
## (some tool)
## (url)

SIMPLI_log_source `basename "$BASH_SOURCE"`

## prerequisites :
## (none)
## require_apt_packet …


check_xxx-example_installed_root()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"
	OSL_OUTPUT_warn_not_implemented "[$FUNCNAME()]"
	## nothing
	return 1
}
ensure_xxx-example_installed_root()
{
	OSL_debug "[$FUNCNAME($*)]"
	OSL_OUTPUT_warn_not_implemented "[$FUNCNAME()]"
	## nothing
	return 1
}

check_xxx-example_installed_user()
{
	OSL_debug "[$FUNCNAME($*)]"
	OSL_OUTPUT_warn_not_implemented "[$FUNCNAME()]"
	## nothing
	return 1
}
ensure_xxx-example_installed_user()
{
	OSL_debug "[$FUNCNAME($*)]"
	OSL_OUTPUT_warn_not_implemented "[$FUNCNAME()]"
	## nothing
	return 1
}

ensure_xxx-example_sourced()
{
	#OSL_debug "[$FUNCNAME($*)]"
	OSL_OUTPUT_warn_not_implemented "[$FUNCNAME()]"
	## nothing
	return 1
}

## output one-line info (version, build, etc.)
get_installed_xxx-example_summary()
{
	ensure_xxx-example_sourced

	OSL_OUTPUT_warn_not_implemented "[$FUNCNAME()]"
	return 1
}

get_installed_xxx-example_version()
{
	ensure_xxx-example_sourced

	OSL_OUTPUT_warn_not_implemented "[$FUNCNAME()]"
	return 1
}

return 0
