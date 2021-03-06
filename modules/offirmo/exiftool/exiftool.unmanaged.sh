## Shell provision script for :
## exiftool
## http://www.sno.phy.queensu.ca/~phil/exiftool

SIMPLI_log_source `basename "$BASH_SOURCE"`

## prerequisites :
require_apt_packet  build-essential  ## since we build from source
require_apt_packet  perl
require_apt_packet  wget


check_offirmo_exiftool_installed_root()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"

	## tricky because we're interested with version on this one
	which exiftool &> /dev/null
	[[ $? -ne 0 ]] && return 1

	## now check version
	local version=`get_installed_offirmo_exiftool_version`
	## TODO enhance
	[[ "$version" = "9.53" ]] && return 0

	return 1
}
ensure_offirmo_exiftool_installed_root()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"

	local archive="$ROOT_TEMP_AREA_PATH/Image-ExifTool-9.53.tar.gz"
	local dest_dir="$ROOT_BIN_AREA_PATH/Image-ExifTool_9.53"

	if [[ ! -f "${archive}" ]]; then
		## safe download
		rm -rf "${archive}.temp"
		wget http://www.sno.phy.queensu.ca/~phil/exiftool/Image-ExifTool-9.53.tar.gz --output-document="${archive}.temp"
		[[ $? -ne 0 ]] && rm "${archive}.temp" && return 1
		mv "${archive}.temp" "${archive}"
	fi

	## safe unpack
	rm -rf "${dest_dir}.temp"
	OSL_ARCHIVE_unpack_to "${archive}" "${dest_dir}.temp"
	[[ $? -ne 0 ]] && rm -rf "${dest_dir}.temp" && return 1
	mv "${dest_dir}.temp" "${dest_dir}"

	cd "$dest_dir"
	perl Makefile.PL
	sudo make install
	local res=$?
	cd -

	return $res
}

check_offirmo_exiftool_installed_user()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"
	## root only
	return 0
}
ensure_offirmo_exiftool_installed_user()
{
	SIMPLI_log_call "[$FUNCNAME($*)]"
	## root only
	return 0
}

ensure_offirmo_exiftool_sourced()
{
	#SIMPLI_log_call "[$FUNCNAME($*)]"
	## nothing
	return 0
}

## output one-line info (version, build, etc.)
get_installed_offirmo_exiftool_summary()
{
	get_installed_offirmo_exiftool_version
}

get_installed_offirmo_exiftool_version()
{
	# nice
	exiftool -ver
}

return 0
