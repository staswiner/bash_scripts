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

vim --cmd ":set key=$password" $file
