#!/bin/bash

source ./logger

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
			--project=*) 
					PROJECT_NAME="${1#*=}"; 
					logger.info project=$PROJECT_NAME; shift;;
			--master-ip=*)
				 MASTER_IP="${1#*=}"; 
				logger.info master-ip=$MASTER_IP; shift;;
			--) break ;;
			*) logger.error invalid_usage $1; shift;;
		esac
	done
}

main()
{
	logger.warn Hello World!
	logger.debug Hello World!

	parse_args $@
}

main $@
