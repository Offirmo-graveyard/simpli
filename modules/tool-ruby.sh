## Shell provision script for :
## ruby
## https://gorails.com/setup/ubuntu/14.04

SIMPLI_log_source `basename "$BASH_SOURCE"`

require_apt_packet ruby

##
##Updating system......
##Installing required packages: libreadline6-dev, zlib1g-dev, libssl-dev, libyaml-dev, libsqlite3-dev, sqlite3, pkg-config....

check_tool-ruby_installed_sudo()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"
	## nothing, apt only
	return 0
}
ensure_tool-ruby_installed_sudo()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"
	## nothing, apt only
	return 0
}

check_tool-ruby_installed_user()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"
	## nothing, apt only
	return 0
}
ensure_tool-ruby_installed_user()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"
	## nothing, apt only
	return 0
}

ensure_tool-ruby_sourced()
{
	#SIMPLI_log_call "[$FUNCNAME($*)]"
	## nothing needed
	return 0
}

## output one-line info (version, build, etc.)
get_installed_tool-ruby_summary()
{
	ruby --version
}

get_installed_tool-ruby_version()
{
	# TODO
	ruby --version
}


## additional utilities
require_gem()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"
	[[ $SIMPLI_EXEC_MODE = "sudo" ]] && return 0; ## npm packages are user only

	local module_name="$1"

	## npm list is slow. We'll directly check folder presence
	local package_dir="$NODE_PATH/$module_name"
	[[ -d "$package_dir" ]] && return 0
	npm install --global $module_name
	OSL_EXIT_abort_execution_if_bad_retcode $? "npm module '$module_name' couldn't be installed !"

	return 0
}
return 0
