## Shell provision script for :
## ruby
## https://gorails.com/setup/ubuntu/14.04

SIMPLI_log_source `basename "$BASH_SOURCE"`

## ruby-dev is needed to build native extensions
## "ruby" pkt must be installed first
require_apt_packet ruby
require_apt_packet ruby-dev

##
##Updating system......
##Installing required packages: libreadline6-dev, zlib1g-dev, libssl-dev, libyaml-dev, libsqlite3-dev, sqlite3, pkg-config....

check_offirmo_ruby_installed_root()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"
	## nothing, apt only
	return 0
}
ensure_offirmo_ruby_installed_root()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"
	## nothing, apt only
	return 0
}

check_offirmo_ruby_installed_user()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"
	## nothing, apt only
	return 0
}
ensure_offirmo_ruby_installed_user()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"
	## nothing, apt only
	return 0
}

ensure_offirmo_ruby_sourced()
{
	#SIMPLI_log_call "[$FUNCNAME($*)]"
	## nothing needed
	return 0
}

## output one-line info (version, build, etc.)
get_installed_offirmo_ruby_summary()
{
	ruby --version
}

get_installed_offirmo_ruby_version()
{
	# TODO
	ruby --version
}


## additional utilities
require_ruby_gem()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"
	[[ $SIMPLI_EXEC_MODE != "root" ]] && return 0; ## this ruby is sytem-wide

	local gem_name="$1"

	gem install --no-rdoc --no-ri $gem_name
	OSL_EXIT_abort_execution_if_bad_retcode $? "ruby gem '$gem_name' couldn't be installed !"

	return 0
}

return 0
