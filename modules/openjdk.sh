## Shell provision script for
## Java Development Kit

SIMPLI_log_source `basename "$BASH_SOURCE"`

require_apt_packet  openjdk-7-jdk


check_jdk_installed_sudo()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"
	## nothing	## nothing, apt only
	return 0
}
ensure_jdk_installed_sudo()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"
	## nothing, apt only
	return 0
}

check_jdk_installed_user()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"
	## nothing, apt only
	return 0
}
ensure_jdk_installed_user()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"
	## nothing, apt only
	return 0
}

ensure_jdk_sourced()
{
	#SIMPLI_log_call "[$FUNCNAME($*)]"
	## nothing
	return 0
}

## output one-line info (version, build, etc.)
get_installed_jdk_summary()
{
	## version is a paragraph beginning with line "java version "x.y.z""
	java -version | grep 'version'
}

get_installed_jdk_version()
{
	## TODO !
	java -version
}

return 0
