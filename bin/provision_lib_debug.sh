#! /bin/bash

## simpli : SIMple Provisioning Library

## to be called like that :
## SIMPLI_log_call "[$FUNCNAME($*)]"
SIMPLI_log_call()
{
	OSL_debug $*
	#do_nothing=1
}

## to be called like that :
## SIMPLI_log_source `basename "$BASH_SOURCE"`
SIMPLI_log_source()
{
	#OSL_debug "file '$*' is being evaluated…"
	do_nothing=1
}

SIMPLI_log_module_defs()
{
	#OSL_debug $*
	do_nothing=1
}
