## Shell provision script for :
## python

SIMPLI_log_source `basename "$BASH_SOURCE"`

require_apt_packet python


check_python_installed_sudo()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"
	## nothing, apt only
	return 0
}
ensure_python_installed_sudo()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"
	## nothing, apt only
	return 0
}

check_python_installed_user()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"
	## nothing, apt only
	return 0
}
ensure_python_installed_user()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"
	## nothing, apt only
	return 0
}

ensure_python_sourced()
{
	#SIMPLI_log_call "[$FUNCNAME($*)]"
	## nothing needed
	return 0
}

## output one-line info (version, build, etc.)
get_installed_python_summary()
{
	## version is like "Python 2.7.6" and is outputed on stderr...
	python --version 2>&1
}

get_installed_python_version()
{
	#TODO
	python --version 2>&1
}

return 0
