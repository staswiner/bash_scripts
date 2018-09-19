#!/bin/bash

usage()
{
  "usage $0: [password] [file]"
}

if [ -z $2 ]; then
  usage
  exit
fi

key=$1
file=$2

./decrypt_file.sh $key $file
cat text
./encrypt_file.sh $key $file
