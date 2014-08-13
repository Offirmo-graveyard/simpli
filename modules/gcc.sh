## Shell provision script for :
## GNU Compiler Collection (gcc)

SIMPLI_log_source `basename "$BASH_SOURCE"`

require_apt_packet build-essential


check_gcc_installed_sudo()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"
	## nothing, apt only
	return 0
}
ensure_gcc_installed_sudo()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"
	## nothing, apt only
	return 0
}

check_gcc_installed_user()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"
	## nothing, apt only
	return 0
}
ensure_gcc_installed_user()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"
	## nothing, apt only
	return 0
}

ensure_gcc_sourced()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"
	## nothing
	return 0
}

get_installed_gcc_summary()
{
	get_installed_gcc_version
}

get_installed_gcc_version()
{
	# nice
	gcc -dumpversion
}

return 0
