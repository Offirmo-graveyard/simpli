## Shell provision script for
## Open Search Server

SIMPLI_log_source `basename "$BASH_SOURCE"`

## prerequisites :
require offirmo/oracle-jdk '~7'

#OSS_VERSION=1.5-b674
OSS_VERSION=1.5-b800
export SIMPLI_MODULE_OFFIRMO_OSS_DIR="$ROOT_BIN_AREA_PATH/opensearchserver_$OSS_VERSION"
OFFIRMO_OSS_ARCHIVE_URL=http://www.open-search-server.com/ftp/OpenSearchServer_1.5/build-1.5-b800/opensearchserver-1.5.9-SNAPSHOT-b800.tar.gz


check_offirmo_opensearchserver_installed_root()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"
	require_env_line "export OSS_DIR=$SIMPLI_MODULE_OFFIRMO_OSS_DIR"
	[[ -d $SIMPLI_MODULE_OFFIRMO_OSS_DIR ]] && return 0;
	return 1
}
ensure_offirmo_opensearchserver_installed_root()
{
	OSL_debug "[$FUNCNAME($*)]"

	local archive="$ROOT_TEMP_AREA_PATH/opensearchserver-$OSS_VERSION.tar.gz"
	local dest_dir=$SIMPLI_MODULE_OFFIRMO_OSS_DIR

	if [[ ! -f "${archive}" ]]; then
		## safe download
		rm -rf "${archive}.temp"
		wget $OFFIRMO_OSS_ARCHIVE_URL --output-document="${archive}.temp"
		[[ $? -ne 0 ]] && rm "${archive}.temp" && return 1
		mv "${archive}.temp" "${archive}"
	fi

	## safe unpack
	rm -rf "${dest_dir}.temp"
	## note that we need to hint at archive unpack dir (last param)
	OSL_ARCHIVE_unpack_to "${archive}" "${dest_dir}.temp" "opensearchserver"
	[[ $? -ne 0 ]] && rm -rf "${dest_dir}.temp" && return 1
	mv "${dest_dir}.temp" "${dest_dir}"

	return 0
}

check_offirmo_opensearchserver_installed_user()
{
	OSL_debug "[$FUNCNAME($*)]"
	## nothing
	return 0
}
ensure_offirmo_opensearchserver_installed_user()
{
	OSL_debug "[$FUNCNAME($*)]"
	## nothing
	return 0
}

ensure_offirmo_opensearchserver_sourced()
{
	#OSL_debug "[$FUNCNAME($*)]"
	#OSL_OUTPUT_warn_not_implemented "[$FUNCNAME()]"
	## nothing
	return 0
}

## output one-line info (version, build, etc.)
get_installed_offirmo_opensearchserver_summary()
{
	ensure_offirmo_opensearchserver_sourced
	echo "$OSS_VERSION, installed in : $SIMPLI_MODULE_OFFIRMO_OSS_DIR"
}

get_installed_offirmo_opensearchserver_version()
{
	ensure_offirmo_opensearchserver_sourced
	echo "$OSS_VERSION"
}

return 0
