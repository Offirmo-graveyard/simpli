## Shell provision script for :
## Oracle Java Development Kit

## root-only script
[[ `id -u` -ne 0 ]] && return 0

## avoid repeating this install uselessly
STAMP_FILE=$ROOT_PROV_AREA_PATH/ORACLE_JDK_APT_SOURCE_INSTALLED.stamp
[[ -f "$STAMP_FILE" ]] && return 0

add-apt-repository "ppa:webupd8team/java"

## mark done
echo "# `date`" > "$STAMP_FILE"
