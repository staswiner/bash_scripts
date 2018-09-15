#!/bin/bash
_add_option () 
{ 
    local option=$1;
    local current="${COMP_WORDS[COMP_CWORD]}";
    local previous="${COMP_WORDS[COMP_CWORD-1]}";
    COMPREPLY+=($(compgen -W "$option" -- $current))
}

_add_multi_option () 
{ 
    local option=$1;
    shift;
    local answers="$@";
    local current="${COMP_WORDS[COMP_CWORD]}";
    local previous="${COMP_WORDS[COMP_CWORD-1]}";
    if [[ $previous = $option ]]; then
        COMPREPLY=($(compgen -W "$answers" -- $current));
        return 1;
    fi;
    COMPREPLY+=($(compgen -W "$option" -- $current));
    return 0
}

_compose_options()
{
	COMPREPLY=();
	local current="${COMP_WORDS[COMP_CWORD]}";
	projects="kafka kafka-test"
_add_multi_option "--project" $projects
[[ $? = 1 ]] && return 0

_add_multi_option "--lama" "very much"
[[ $? = 1 ]] && return 0

master_ips="zose-master01 zose-master02"
_add_multi_option "--master-ip" $master_ips
[[ $? = 1 ]] && return 0

#_add_option "-h"
}

complete -F _compose_options ./script.sh
