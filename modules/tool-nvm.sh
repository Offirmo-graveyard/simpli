## Shell provision script for :
## nvm 0.7
## https://github.com/creationix/nvm

SIMPLI_log_source `basename "$BASH_SOURCE"`



check_tool-nvm_installed_sudo()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"
	## user-land only
	return 0
}
ensure_tool-nvm_installed_sudo()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"
	## user-land only
	return 0
}

check_tool-nvm_installed_user()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"
	[[ -d ~/.nvm ]] && return 0
	return 1
}
ensure_tool-nvm_installed_user()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"
	curl https://raw.githubusercontent.com/creationix/nvm/v0.7.0/install.sh | sh
	OSL_EXIT_abort_execution_if_bad_retcode $? "nvm install script"
	OSL_FILE_ensure_line_is_present_in_file "[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh # This loads NVM" "~/.bashrc"
	OSL_EXIT_abort_execution_if_bad_retcode $? "nvm source line in .bashrc"
	return 0
}

ensure_tool-nvm_sourced()
{
	#SIMPLI_log_call "[$FUNCNAME($*)]"
	source ~/.nvm/nvm.sh
	return $?
}

## output one-line info (version, build, etc.)
get_installed_tool-nvm_summary()
{
	ensure_tool-nvm_sourced
	echo -n "Node Version Manager "
	nvm --version
}

get_installed_tool-nvm_version()
{
	nvm --version
}

return 0
