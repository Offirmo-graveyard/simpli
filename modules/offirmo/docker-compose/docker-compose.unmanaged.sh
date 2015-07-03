## Shell provision script for
## docker-compose
## https://docs.docker.com/compose/
## https://docs.docker.com/compose/install/

SIMPLI_log_source `basename "$BASH_SOURCE"`


require_apt_packet curl


check_offirmo_docker-compose_installed_root()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"
	[[ -f /usr/local/bin/docker-compose ]] && return 0;
	return 1;
}
ensure_offirmo_docker-compose_installed_root()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"
	curl -L https://github.com/docker/compose/releases/download/1.1.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
	chmod +x /usr/local/bin/docker-compose
	return $?
}

check_offirmo_docker-compose_installed_user()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"
	## nothing, root only
	return 0
}
ensure_offirmo_docker-compose_installed_user()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"
	## nothing, root only
	return 0
}

ensure_offirmo_docker-compose_sourced()
{
	#SIMPLI_log_call "[$FUNCNAME($*)]"
	## nothing
	return 0
}

## output one-line info (version, build, etc.)
get_installed_offirmo_docker-compose_summary()
{
	docker-compose --version
}

get_installed_offirmo_docker-compose_version()
{
	echo "TODO `docker-compose --version`"
}


####### Utilities #######

return 0
