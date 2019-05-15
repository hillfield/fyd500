#!/bin/bash

POS=()
_file=$(echo ${0} | awk -F '/' '{print $NF}')
clear
printf "The script has the name %s\n" $_file

echo "These are all the arguments: "
while [[ $# -gt 0 ]]
do
	printf "%s\n" $1
	POS+=("$1")
	shift
done

set "${POS[@]}"

echo "==================="
printf "Argument 1 =$1\n\
Argument 1 =$2\n\
Argument 2 =$3\n\
Argument 10 =${10}\n"

printf "The total number of arguments is: %d\n" $#

if [[ $# -gt 3 ]];then
	shift;shift;shift
	fi

printf "Argument 1 =$1\n\
Argument 1 =$2\n\
Argument 1 =$3\n"

while [[ $# -gt 0 ]]
do
	printf "\nCurrent argument is: %s" $1
	shift
done

