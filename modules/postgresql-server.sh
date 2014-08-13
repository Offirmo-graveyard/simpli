## Shell provision script for
## Java Development Kit

SIMPLI_log_source `basename "$BASH_SOURCE"`

require_apt_packet  postgresql


check_postgresql_installed_sudo()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"
	## nothing	## nothing, apt only
	return 0
}
ensure_postgresql_installed_sudo()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"
	## nothing, apt only
	return 0
}

check_postgresql_installed_user()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"
	## nothing, apt only
	return 0
}
ensure_postgresql_installed_user()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"
	## nothing, apt only
	return 0
}

ensure_postgresql_sourced()
{
	#SIMPLI_log_call "[$FUNCNAME($*)]"
	## nothing
	return 0
}

## output one-line info (version, build, etc.)
get_installed_postgresql_summary()
{
	psql --version
}

get_installed_postgresql_version()
{
	#TODO
	psql --version
}

return 0
