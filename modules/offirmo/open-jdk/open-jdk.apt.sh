## Shell provision script for
## Java Development Kit

SIMPLI_log_source `basename "$BASH_SOURCE"`

require_apt_packet  openjdk-7-jdk


check_offirmo_openjdk_installed_root()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"
	## nothing, apt only
	return 0
}
ensure_offirmo_openjdk_installed_root()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"
	## nothing, apt only
	return 0
}

check_offirmo_openjdk_installed_user()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"
	## nothing, apt only
	return 0
}
ensure_offirmo_openjdk_installed_user()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"
	## nothing, apt only
	return 0
}

ensure_offirmo_openjdk_sourced()
{
	#SIMPLI_log_call "[$FUNCNAME($*)]"

	## TODO alternatives ?

	return 1
}

## output one-line info (version, build, etc.)
get_installed_offirmo_openjdk_summary()
{
	ensure_offirmo_openjdk_sourced

	## version is a paragraph beginning with line "java version "x.y.z""
	java -version | grep 'version'
}

get_installed_offirmo_openjdk_version()
{
	ensure_offirmo_openjdk_sourced

	## TODO !
	java -version
}

return 0
