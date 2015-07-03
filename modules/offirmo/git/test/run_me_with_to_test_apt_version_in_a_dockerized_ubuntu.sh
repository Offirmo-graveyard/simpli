#!/bin/bash

## Test of git provisionning

echo ""
echo "######################################################"
echo "# Testing SIMPLI git module provisionning - apt mode #"
echo "######################################################"

TEST_DIR="`dirname "$BASH_SOURCE"`"
SIMPLI_DIR="$TEST_DIR/../../.."

mkdir -p tmp/simpli
cp -r $SIMPLI_DIR/bin tmp/simpli

#sudo docker rmi -f simpli_test/git.apt:1

sudo docker build --tag simpli_test/git.apt:latest "$TEST_DIR"


#sudo docker run -t -i simpli_test/git.apt:1 bash
