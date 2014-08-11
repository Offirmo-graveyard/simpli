## Shell provision script for
## Java Development Kit

SIMPLI_log_source `basename "$BASH_SOURCE"`

require_apt_packet  postgresql


check_tool-postgresql_installed_sudo()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"
	## nothing	## nothing, apt only
	return 0
}
ensure_tool-postgresql_installed_sudo()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"
	## nothing, apt only
	return 0
}

check_tool-postgresql_installed_user()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"
	## nothing, apt only
	return 0
}
ensure_tool-postgresql_installed_user()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"
	## nothing, apt only
	return 0
}

ensure_tool-postgresql_sourced()
{
	#SIMPLI_log_call "[$FUNCNAME($*)]"
	## nothing
	return 0
}

## output one-line info (version, build, etc.)
get_installed_tool-postgresql_summary()
{
	psql --version
}

get_installed_tool-postgresql_version()
{
	#TODO
	psql --version
}

return 0
