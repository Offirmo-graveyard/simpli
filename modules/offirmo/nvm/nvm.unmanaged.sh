## Shell provision script for :
## nvm 0.7
## https://github.com/creationix/nvm

SIMPLI_log_source `basename "$BASH_SOURCE"`

SIMPLI_MODULE_NVM_DEFAULT_VERSION='0.7.0'
SIMPLI_MODULE_NVM_DEFAULT_NODE_VERSION='0.10.30'

## node build prerequisites :
## https://github.com/joyent/node/wiki/installation
require offirmo/gcc '^4.2.0'
require offirmo/make '^3.81.0'
require offirmo/python '~2.6'
## just to download nvm
require_apt_packet  curl


check_offirmo_nvm_installed_root()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"
	## user-land only
	return 0
}
ensure_offirmo_nvm_installed_root()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"
	## user-land only
	return 0
}

check_offirmo_nvm_installed_user()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"
	[[ -d ~/.nvm ]] && return 0
	return 1
}
ensure_offirmo_nvm_installed_user()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"
	curl "https://raw.githubusercontent.com/creationix/nvm/v${SIMPLI_MODULE_NVM_DEFAULT_VERSION}/install.sh" | sh
	OSL_EXIT_abort_execution_if_bad_retcode $? "nvm install script"
	## depending to nvm version, this line is not always added
	OSL_FILE_ensure_line_is_present_in_file "[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh # This loads NVM" "~/.bashrc"
	OSL_EXIT_abort_execution_if_bad_retcode $? "nvm source line in .bashrc"
	return 0
}

ensure_offirmo_nvm_sourced()
{
	#SIMPLI_log_call "[$FUNCNAME($*)]"
	source ~/.nvm/nvm.sh
	return $?
}

## output one-line info (version, build, etc.)
get_installed_offirmo_nvm_summary()
{
	ensure_offirmo_nvm_sourced
	echo -n "Node Version Manager "
	nvm --version
}

get_installed_offirmo_nvm_version()
{
	## nice, no parsing to do
	nvm --version
}



###################################################
## additional utilities

## require a precise node version installation via nvm
require_nvm_node()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"
	[[ $SIMPLI_EXEC_MODE == "root" ]] && return 0; ## nvm nodes are user only

	local node_version="$1"

	ensure_offirmo_nvm_sourced

	## check already installed
	nvm use "v$node_version" &> /dev/null
	[[ $? -ne 0 ]] && nvm install "v$module_version"
	return $?
}

ensure_offirmo_nvm_node_sourced()
{
	#SIMPLI_log_call "[$FUNCNAME($*)]"
	[[ $SIMPLI_EXEC_MODE == "root" ]] && return 0; ## nvm nodes are user only

	local node_version="$1"

	ensure_offirmo_nvm_sourced
	OSL_EXIT_abort_execution_if_bad_retcode $? "Couldn't source nvm !"

	nvm use "v$node_version" &> /dev/null
	OSL_EXIT_abort_execution_if_bad_retcode $? "nvm node '$node_version' is not available !"

	return 0
}


require_nvm_node_npm_global_module()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"
	[[ $SIMPLI_EXEC_MODE == "root" ]] && return 0; ## npm packages are user only

	local node_version="$1"
	local module_name="$2"

	ensure_offirmo_nvm_node_sourced $node_version

	## npm list is slow. We'll directly check folder presence
	local package_dir="$NODE_PATH/$module_name"
	[[ -d "$package_dir" ]] && return 0 ## already installed
	npm install --global $module_name
	OSL_EXIT_abort_execution_if_bad_retcode $? "npm module '$module_name' couldn't be installed for node v$node_version !"

	return 0
}
