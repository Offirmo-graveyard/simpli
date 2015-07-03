## Shell provision script for
## docker, a platform for developers and sysadmins to develop, ship, and run applications
## https://www.docker.com/

## root-only script
[[ `id -u` -ne 0 ]] && return 0

## avoid repeating this install uselessly
STAMP_FILE=$ROOT_PROV_AREA_PATH/DOCKER_APT_SOURCE_INSTALLED.stamp
[[ -f "$STAMP_FILE" ]] && return 0

## http://docs.docker.com/installation/ubuntulinux/
## https://get.docker.com/ubuntu/

# add docker repository key
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9

# Add the repository to our APT sources
echo deb https://get.docker.com/ubuntu docker main > /etc/apt/sources.list.d/docker.list

## mark done
echo "# `date`" > "$STAMP_FILE"
