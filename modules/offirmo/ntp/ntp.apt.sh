## Shell provision script for
## Network Time Protocol client

SIMPLI_log_source `basename "$BASH_SOURCE"`

require_apt_packet  ntp


check_offirmo_ntp_installed_root()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"
	## nothing	## nothing, apt only
	return 0
}
ensure_offirmo_ntp_installed_root()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"
	## nothing, apt only
	return 0
}

check_offirmo_ntp_installed_user()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"
	## nothing, apt only
	return 0
}
ensure_offirmo_ntp_installed_user()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"
	## nothing, apt only
	return 0
}

ensure_offirmo_ntp_sourced()
{
	#SIMPLI_log_call "[$FUNCNAME($*)]"
	## nothing
	return 0
}

## output one-line info (version, build, etc.)
get_installed_offirmo_ntp_summary()
{
	## version is on two lines
	ntpd --version | head -n 1
}

get_installed_offirmo_ntp_version()
{
	echo "TODO ntp version"

}

return 0
