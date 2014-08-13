## Shell provision script for
## redis server

SIMPLI_log_source `basename "$BASH_SOURCE"`

require_apt_packet  redis-server


check_redis-server_installed_sudo()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"
	## nothing	## nothing, apt only
	return 0
}
ensure_redis-server_installed_sudo()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"
	## nothing, apt only
	return 0
}

check_redis-server_installed_user()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"
	## nothing, apt only
	return 0
}
ensure_redis-server_installed_user()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"
	## nothing, apt only
	return 0
}

ensure_redis-server_sourced()
{
	#SIMPLI_log_call "[$FUNCNAME($*)]"
	## nothing
	return 0
}

## output one-line info (version, build, etc.)
get_installed_redis-server_summary()
{
	redis-server --version
}

get_installed_redis-server_version()
{
	#TODO
	redis-server --version
}

return 0
