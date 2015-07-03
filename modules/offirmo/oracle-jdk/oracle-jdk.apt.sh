## Shell provision script for :
## Oracle Java Development Kit

SIMPLI_log_source `basename "$BASH_SOURCE"`


## oracle-java8-installer	shared/present-oracle-license-v1-1	note
## oracle-java8-installer	shared/accepted-oracle-license-v1-1	boolean	true
## oracle-java8-installer	oracle-java8-installer/local	string
## oracle-java8-installer	shared/error-oracle-license-v1-1	error
## oracle-java8-installer	oracle-java8-installer/not_exist	error
if [[ $SIMPLI_EXEC_MODE == "root" ]]; then
	echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 boolean true" > /tmp/oracle-license-debconf
	/usr/bin/debconf-set-selections /tmp/oracle-license-debconf
	rm /tmp/oracle-license-debconf
fi

require_apt_packet  oracle-java8-installer
require_apt_packet  oracle-java8-set-default


check_offirmo_oracle-jdk_installed_root()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"
	## nothing, apt only
	return 0
}
ensure_offirmo_oracle-jdk_installed_root()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"
	## nothing, apt only
	return 0
}

check_offirmo_oracle-jdk_installed_user()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"
	## nothing, apt only
	return 0
}
ensure_offirmo_oracle-jdk_installed_user()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"
	## nothing, apt only
	return 0
}

ensure_offirmo_oracle-jdk_sourced()
{
	#SIMPLI_log_call "[$FUNCNAME($*)]"

	## TODO JAVA_HOME + PATH

	return 1
}

## output one-line info (version, build, etc.)
get_installed_offirmo_oracle-jdk_summary()
{
	ensure_offirmo_oracle-jdk_sourced

	## version is a paragraph beginning with line "java version "x.y.z""
	java -version 2>&1 | head -n 1
}

get_installed_offirmo_oracle-jdk_version()
{
	ensure_offirmo_oracle-jdk_sourced

	## slightly easier by using javac
	javac -version 2>&1 | awk '{print $2}'
}

return 0
