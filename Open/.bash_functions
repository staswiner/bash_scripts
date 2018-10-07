#!/bin/bash 

__open_selection() {
	select file in $@
	do
		echo "$file picked"
		__open_file $file
		break
	done

}

__open_file() {
	vim $1
	return;
}

__auto_complete() {
	COMPREPLY=()
	local option=$1;
	shift;
	local answers=`find -type f | grep -v ".git"`
	local current="${COMP_WORDS[COMP_CWORD]}";
	COMPREPLY=($(compgen -W "$answers" -- $current));
	# COMPREPLY+=($(compgen -W "$option" -- $current));
	return 0;
}

open() {
	filename=$1
	findcommand="find -type f | grep $filename"
	matches=`eval $findcommand`
	lengthcommand=`echo "$findcommand | wc -l"`
	length=`eval $lengthcommand`
	echo "num matches: $length"
	if [[ $length == 1 ]]; then
		match=$matches
		__open_file $match
	elif [[ $length > 1 ]]; then
		__open_selection $matches
	elif [[ $length == 0 ]];then
		echo "no matches found"
	fi
}

complete -F __auto_complete open
