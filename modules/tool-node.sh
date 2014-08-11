## Shell provision script for :
## node.js
## https://github.com/joyent/node/wiki/installation

SIMPLI_log_source `basename "$BASH_SOURCE"`

## prerequisites :
## https://github.com/joyent/node/wiki/installation
require tool-gcc '^4.2.0'
require tool-make '^3.81.0'
require tool-python '~2.6'

## we'll install node via nvm
require tool-nvm '~0.7.0'


check_tool-node_installed_sudo()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"
	## nothing, installed in userland
	return 0
}
ensure_tool-node_installed_sudo()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"
	## nothing, installed in userland
	return 0
}

check_tool-node_installed_user()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"
	local module_version="$1"

	ensure_tool-nvm_sourced
	nvm use "v$module_version" &> /dev/null
	return $?
}
ensure_tool-node_installed_user()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"
	local module_version="$1"

	ensure_tool-nvm_sourced
	nvm install "v$module_version"
	return $?
}

ensure_tool-node_sourced()
{
	#SIMPLI_log_call "[$FUNCNAME($*)]"
	local module_version="$1"

	ensure_tool-nvm_sourced
	echo "testing nvm use v$module_version &> /dev/null"
	nvm use "v$module_version" &> /dev/null
	return $?
}

## output one-line info (version, build, etc.)
get_installed_tool-node_summary()
{
	ensure_tool-node_sourced
	node --version
}

get_installed_tool-node_version()
{
	#TODO tricky
}


## additional utilities
require_npm_global_module()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"
	[[ $SIMPLI_EXEC_MODE = "sudo" ]] && return 0; ## npm packages are user only

	local node_version="$1"
	local module_name="$2"

	ensure_tool-node_sourced $node_version

	## npm list is slow. We'll directly check folder presence
	local package_dir="$NODE_PATH/$module_name"
	[[ -d "$package_dir" ]] && return 0 ## already installed
	npm install --global $module_name
	OSL_EXIT_abort_execution_if_bad_retcode $? "npm module '$module_name' couldn't be installed for node v$node_version !"

	return 0
}

return 0
