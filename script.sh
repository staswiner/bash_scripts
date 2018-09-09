#!/bin/bash

usage()
{
	echo "usage $0: [-h] [--help]"
	exit 1
}

invalid_usage()
{
	echo "unknown parameter $1"
	echo "usage $0: [-h] [--help]"
	exit 2
}

parse_args()
{
	while [[ $# -gt -0 ]]
	do
		case $1 in
			-h|--help) usage; shift;;
			--project=*) PROJECT_NAME="${1#*=}"; echo project = $PROJECT_NAME; shift;;
			--master-ip=*) MASTER_IP="${1#*=}"; echo master-ip = $MASTER_IP; shift;;
			--) break ;;
			*) invalid_usage $1; shift;;
		esac
	done
}

main()
{
	parse_args $@
}

main $@
