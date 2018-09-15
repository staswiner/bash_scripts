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
	vim --cmd ":set key=$password" -c ":set key=" -c ":wq" $file
done
