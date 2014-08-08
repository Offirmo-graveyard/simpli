#! /bin/bash

## Now load our config
#source cvm_inc_env.sh

## And load our primitives
#source cvm_lib_base.sh

echo ""

echo "~~~ Hello from Offirmo Shell Lib ~~~"
echo "* current version : $OSL_VERSION ($OSL_STAMP)"
echo "* install path    : $OSL_INIT_script_full_dir"


#echo `OSL_CAPABILITIES_APT_get_packet_status build-essential`


declare -A modules

function Module()
{
    # A pointer to this Class. (2)
    base=$FUNCNAME
    this=$1

    # Inherited classes (optional). (3)
    #export ${this}_inherits="Class1 Class2 Class3" # (3.1)

    for class in $(eval "echo \$${this}_inherits")
    do
        for property in $(compgen -A variable ${class}_)
        do
            export ${property/#$class\_/$this\_}="${property}" # (3.2)
        done

        for method in $(compgen -A function ${class}_)
        do
            export ${method/#$class\_/$this\_}="${method} ${this}"
        done
    done

    # Declare Properties. (4)
    export ${this}_name=$1
    export ${this}_global=$2
    export ${this}_ensure=$3
    export ${this}_test=$4

    # Declare methods. (5)
    for method in $(compgen -A function)
    do
        export ${method/#$base\_/$this\_}="${method} ${this}"
    done
}


check_nvm_installed()
{
	echo "check_nvm_installed..."
}

ensure_nvm_installed()
{
	echo "ensure_nvm_installed..."
}

ensure_node_installed()
{
	echo "ensure_node_installed..."
}



Module 'nvm' false ensure_nvm_installed check_nvm_installed
echo "nvm ($nvm_name, $nvm_global, $nvm_ensure, $nvm_test)"

# call
$nvm_ensure


declare -A nvm=( ["name"]="nvm" ["global"]=true ["install"]="nvm install" )


modules=( ["nvm"]='nvm' )

#echo "${modules["moo"]}"
for module in "${!modules[@]}"; do
	echo "$module - ${modules["$module"]}";
done


require()
{
	echo "requiring $1 ($*)"
	module_id="$*"
	if [[ ${modules["$module_id"]} != true ]]; then
		echo "checking install status of $module_id..."
		tmp="ensure_${1}_installed"
		$tmp
		echo "installing $module_id..."
		$($1_ensure)
		modules["$module_id"]=true
	else
		echo "$module_id already installed."
	fi
}

require nvm
require nvm



echo ""

