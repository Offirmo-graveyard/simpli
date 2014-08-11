#! /bin/bash

## Shell provision script for
## a machine able to run lehuit

echo "###################"
echo "# Offirmo dev box #"
echo "###################"

echo "* start ENV"
echo "  - whoami ? `whoami`"
echo "  - pwd    ? `pwd`"
echo "  - LANG   ? `echo $LANG`"
echo "  - LC_ALL ? `echo $LC_ALL`"
#env

## safety
export LC_ALL="en_US.UTF-8"

## prepare env
#OSL_debug_activated=true

## Are we running on a vagrant-generated machine, presumably launched by vagrant-provision ?
## Or on a test machine launched by hand ?
if [[ -d /vagrant ]]; then
	## most likely launched by vagrant-provision, in which case we are in some unknown dir
	cd /vagrant/provisioning
fi

## TODO add special apt sources here before loading simpli
## (no need to update/upgrade, simpli will do it)

## import lib
source ../bin/index.sh

## setup ssh key(s)
if [[ -d /vagrant ]] && [[ $USER = "vagrant" ]]; then
	## means we are on vagrant machine as user
	echo "setting up ssh keys"
	ls -la ~/.ssh
	mkdir -p ~/.ssh/
	if [[ ! -d ~/.ssh.provbkp ]]; then
		cp -r ~/.ssh ~/.ssh.provbkp
	fi
	cp -r /vagrant/credentials/ssh/* ~/.ssh
	chmod 644 ~/.ssh/*
	chmod 600 ~/.ssh/id_rsa
	ls -la ~/.ssh
fi

## provision our stuff
require tool-ntp
require tool-git '^1.8.2'

# manual
#require_apt_packet man

# A useful resource monitoring tool.
# Just run it to test it.
require_apt_packet dstat

# A useful resource monitoring tool. (better than 'top')
# Just run it to test it.
require_apt_packet htop

# useful for misc operations. Also useful for some wordpress plugins
require_apt_packet zip

NODE_VERSION='0.10.30'
require tool-node $NODE_VERSION
#require_npm_global_module npm_lazy
require_npm_global_module $NODE_VERSION grunt-cli
require_npm_global_module $NODE_VERSION npm-pkgr

if [[ $SIMPLI_EXEC_MODE = "user" ]]; then
	#require_git_repo  git@github.com:Offirmo/html_tests.git
	require_git_repo  git@github.com:Offirmo/offirmo-shell-lib.git
	require_git_repo  git@github.com:Offirmo/example_webmodule.js.git
	#require_git_repo  git@github.com:Offirmo/robot_d-animation_par_courriel.git
	#require_git_repo  git@github.com:Offirmo/ecotree.js.git
	#require_git_repo  git@github.com:Offirmo/cvm.git

	require_git_repo  git@github.com:Thibaut/devdocs.git
fi
require tool-ruby '^2.1'
gem env

## display a summary (user-mode only)
print_provisionning_summary

echo
echo
echo
