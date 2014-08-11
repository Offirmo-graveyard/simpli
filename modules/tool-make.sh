## Shell provision script for :
## GNU make

SIMPLI_log_source `basename "$BASH_SOURCE"`

require_apt_packet build-essential


check_tool-make_installed_sudo()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"
	## nothing, apt only
	return 0
}
ensure_tool-make_installed_sudo()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"
	## nothing, apt only
	return 0
}

check_tool-make_installed_user()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"
	## nothing, apt only
	return 0
}
ensure_tool-make_installed_user()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"
	## nothing, apt only
	return 0
}

ensure_tool-make_sourced()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"
	## nothing
	return 0
}

## output one-line info (version, build, etc.)
get_installed_tool-make_summary()
{
	## version is a paragraph beginning with line "GNU Make x.y.z"

	make --version | grep 'GNU Make'
}

get_installed_tool-make_version()
{
	#TODO
}

return 0
