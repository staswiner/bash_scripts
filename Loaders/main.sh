#!/bin/bash

circle() {
	circle_it='\ | / -'
	for i in $circle_it; do
		sleep 0.2
		echo -ne "\r($i)"
	done
}

horizontal() {
	horizontal_it=('*   ' '**  ' '*** ' ' ***' '  **' '   *' '  **' ' ***' '*** ' '**  ')
	for i in "${horizontal_it[@]}"; do
		sleep 0.2
		echo -ne "\r[\e[32m$i\e[0m]"
	done 
}

horizontal_done() {
		echo -e "\r[\e[34m****\e[0m]"
}

hi() {
	echo hi
}

if [[ -z $1 ]]; then
	echo "circle, horizontal"
	exit 1
fi

for i in `seq 3`; do
	${1}
#	echo $i
done
horizontal_done
