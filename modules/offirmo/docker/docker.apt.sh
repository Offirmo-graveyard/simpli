## Shell provision script for
## docker
## a platform for developers and sysadmins to develop, ship, and run applications
## https://www.docker.com/

SIMPLI_log_source `basename "$BASH_SOURCE"`


## note : needs a 3.8 kernel


require_apt_packet lxc-docker


check_offirmo_docker_installed_root()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"
	## nothing, apt only
	return 0
}
ensure_offirmo_docker_installed_root()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"
	## nothing, apt only
	return 0
}

check_offirmo_docker_installed_user()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"
	## nothing, apt only
	return 0
}
ensure_offirmo_docker_installed_user()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"
	## nothing, apt only
	return 0
}

ensure_offirmo_docker_sourced()
{
	#SIMPLI_log_call "[$FUNCNAME($*)]"
	## nothing
	return 0
}

## output one-line info (version, build, etc.)
get_installed_offirmo_docker_summary()
{
	docker --version
}

get_installed_offirmo_docker_version()
{
	echo "TODO `docker --version`"
}


####### Utilities #######

return 0
