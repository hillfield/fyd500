#!/usr/bin/bash

POS=()
while [[ $# -gt 0 ]]
do
	key="$1"
	case $key in
		-m|--month)
			MONTH="$2"
			shift #shifted past argument
			shift #shifted past value
			;;
		-y|--year)
			YEAR="$2"
			shift #shifted past argument
			shift #shifted past value
			;;
		*)
			POS+=("$1")
			shift
			;;
	esac
done

_nofDays=$(cal $MONTH $YEAR | awk '{if(NR>2) print $0}' | wc | awk '{print $2}')

if [[ -n $# ]]; then #if $1 is non-zero
	if [[ -n $MONTH ]] && [[ -n $YEAR ]]; then
		printf "%-20s\t%d\n" "Specified year:" $YEAR
		printf "%-20s\t%d\n" "Specified month:" $MONTH
		printf "%-20s\t%d\n" "Num. of days:" $_nofDays
	elif [[ -n $MONTH ]]; then
		echo "Month"
	elif [[ -n $YEAR ]]; then
		echo "Year"
	fi	
else 
	echo "Please specify a (y)ear or a (m)onth"
fi






