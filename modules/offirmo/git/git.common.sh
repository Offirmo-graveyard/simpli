## Shell provision script for
## git version control

SIMPLI_log_source `basename "$BASH_SOURCE"`


####### Utilities #######

## Ensure checkout of a git repo.
## WARNING git must be required manually before using this function.
## WARNING appropriate git credentials (ssh, user...) must be set if required !
## XXX removed for now : The optional 2nd param is the destination dir :
## - If not provided, repo will be checked out in user mode in $USER_GIT_AREA_PATH/xyz
## - if provided, will be checked as root or user if in ~home
require_git_repo()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"
	local repository="$1"
	local dest_dir="$2"

	local dest_dir="`SIMPLIMOD_git_compute_dest_dir "$repository" "$dest_dir"`"
	local is_user=true ## by default, this repo is for userland. Anything else is not implemented (yet)

	## prepare summary (nevermind if clone failure)
	local summary_id="git repo '`OSL_FILE_shorten_git_repo_dir "$repository"`'"
	summary_report_complement="${summary_report_complement}$summary_id${SUMMARY_ALIGN:${#summary_id}} $dest_dir\n"

	## check if already ok
	if [[ -d "${dest_dir}/.git" ]]; then
		## already checked out, OK
		OSL_debug "* requiring git repo '$repository' : already cloned."
		return 0
	fi

	## mode check and early exit
	echo $SIMPLI_EXEC_MODE
	if [[ $SIMPLI_EXEC_MODE == "root" ]]; then
		[[ $is_user == true ]] && return 0 ## delay this install to user provisionning
	else
		## user exec mode : check OK if sudo repo
		[[ $is_user == false ]] && OSL_EXIT_abort_execution_with_message "Git repo '$repository' is missing in root dir '$dest_dir'. Did you provision as root first ?"
	fi

	## eventually, clone it
	echo "   `git config --get user.name` (`git config --get user.email`)"
	git clone --recursive  "$repository" "$dest_dir"
	OSL_EXIT_abort_execution_if_bad_retcode $? "Couldn't clone git repo '$repository' in root dir '$dest_dir' !"

	return 0
}


## needed by the user to knw where its repo ended installed
SIMPLIMOD_git_compute_dest_dir()
{
	local repository="$1"
	local dest_parent_dir="$2"

	if [[ -n "$dest_parent_dir" ]]; then
		## ensure no trailing /
		## http://stackoverflow.com/questions/9018723/what-is-the-simplest-way-to-remove-trailing-slashes-from-each-parameter
		dest_parent_dir="${dest_parent_dir%/}"
	else
		dest_parent_dir="$USER_SRC_AREA_PATH"
	fi

	## compute target dir
	local dest_dir="${dest_parent_dir}/`OSL_FILE_extract_git_repo_dir "$repository"`"
	dest_dir=`OSL_FILE_realpath "$dest_dir"`

	echo "$dest_dir"
}


return 0
