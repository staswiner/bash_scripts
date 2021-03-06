#!/bin/bash

usage()
{
	"usage $0: [password] [[list_of_files]]"
}

if [ -z $2 ]; then
	usage
	exit
fi 

password=$1
shift

for file in $@
do
	vim -es --cmd ":set key=$password" -c ":wq" $file
done
