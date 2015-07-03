## Shell provision script for
## Webstorm

SIMPLI_log_source `basename "$BASH_SOURCE"`

## prerequisites :
require offirmo/oracle-jdk '~7'

WEBSTORM_VERSION=8.0.5
export SIMPLI_MODULE_WEBSTORM_DIR="$ROOT_BIN_AREA_PATH/webstorm_$WEBSTORM_VERSION"
OFFIRMO_WEBSTORM_ARCHIVE_URL=http://download.jetbrains.com/webstorm/WebStorm-8.0.5.tar.gz
WEBSTORM_ARCHIVE_OUTPUT_DIR=WebStorm-135.1297


check_offirmo_webstorm_installed_root()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"
	require_env_line "export WEBSTORM_DIR=$SIMPLI_MODULE_WEBSTORM_DIR"
	[[ -d $SIMPLI_MODULE_WEBSTORM_DIR ]] && return 0;
	return 1
}
ensure_offirmo_webstorm_installed_root()
{
	OSL_debug "[$FUNCNAME($*)]"

	local archive="$ROOT_TEMP_AREA_PATH/webstorm-$WEBSTORM_VERSION.tar.gz"
	local dest_dir=$SIMPLI_MODULE_WEBSTORM_DIR

	if [[ ! -f "${archive}" ]]; then
		## safe download
		rm -rf "${archive}.temp"
		wget $OFFIRMO_WEBSTORM_ARCHIVE_URL --output-document="${archive}.temp"
		[[ $? -ne 0 ]] && rm "${archive}.temp" && return 1
		mv "${archive}.temp" "${archive}"
	fi

	## safe unpack
	rm -rf "${dest_dir}.temp"
	## XX note that we need to hint at archive unpack dir (last param)
	OSL_ARCHIVE_unpack_to "${archive}" "${dest_dir}.temp" "$WEBSTORM_ARCHIVE_OUTPUT_DIR"
	[[ $? -ne 0 ]] && rm -rf "${dest_dir}.temp" && return 1
	mv "${dest_dir}.temp" "${dest_dir}"

	return 0
}

check_offirmo_webstorm_installed_user()
{
	OSL_debug "[$FUNCNAME($*)]"
	## nothing
	return 0
}
ensure_offirmo_webstorm_installed_user()
{
	OSL_debug "[$FUNCNAME($*)]"
	## nothing
	return 0
}

ensure_offirmo_webstorm_sourced()
{
	#OSL_debug "[$FUNCNAME($*)]"
	## nothing
	return 0
}

## output one-line info (version, build, etc.)
get_installed_offirmo_webstorm_summary()
{
	ensure_offirmo_webstorm_sourced
	echo "$WEBSTORM_VERSION, installed in : $SIMPLI_MODULE_WEBSTORM_DIR"
}

get_installed_offirmo_webstorm_version()
{
	ensure_offirmo_webstorm_sourced
	echo "$WEBSTORM_VERSION"
}

return 0
