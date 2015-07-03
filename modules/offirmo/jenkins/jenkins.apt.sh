## Shell provision script for :
## Jenkins
## http://jenkins-ci.org/

SIMPLI_log_source `basename "$BASH_SOURCE"`

## prerequisites :
require offirmo/oracle-jdk '^1.6'
require_apt_packet jenkins


JENKINS_URL="localhost:8080"


check_offirmo_jenkins_installed_root()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"
	## nothing, apt only
	return 0
}
ensure_offirmo_jenkins_installed_root()
{
	OSL_debug "[$FUNCNAME($*)]"
	## nothing, apt only
	return 0
}

check_offirmo_jenkins_installed_user()
{
	OSL_debug "[$FUNCNAME($*)]"
	## nothing, apt only
	return 0
}
ensure_offirmo_jenkins_installed_user()
{
	OSL_debug "[$FUNCNAME($*)]"
	## nothing, apt only
	return 0
}

ensure_offirmo_jenkins_sourced()
{
	#OSL_debug "[$FUNCNAME($*)]"
	OSL_OUTPUT_warn_not_implemented "[$FUNCNAME()]"
	## nothing
	return 1
}

## output one-line info (version, build, etc.)
get_installed_offirmo_jenkins_summary()
{
	echo "Jenkins `get_installed_offirmo_jenkins_version`"
}

## output version only
get_installed_offirmo_jenkins_version()
{
	## http://stackoverflow.com/a/23761138/587407
	wget --server-response '$JENKINS_URL/api' 2>&1 | awk '/X-Jenkins:/ {print $2}'
}


###################################
require_jenkins_cli()
{
	wget "$JENKINS_URL/jnlpJars/jenkins-cli.jar"
}
return 0
