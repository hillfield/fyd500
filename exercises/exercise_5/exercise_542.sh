#!/usr/bin/bash

POS=()
while [[ $# -gt 0 ]]
do
	key="$1"
	case $key in
		-m|--month)
			MONTH="$2"
			SW_CASE+='M'
			shift #shifted past argument
			shift #shifted past value
			;;
		-y|--year)
			YEAR="$2"
			SW_CASE+="Y"
			shift #shifted past argument
			shift #shifted past value
			;;
		*)
			POS+=("$1")
			shift
			;;
	esac
done

if [[ -z $YEAR ]];then
	YEAR=$(date +"%Y")
elif [[ -z $MONTH ]];then
	MONTH=$(date +"%m")
fi

_nofDays=$(cal $MONTH $YEAR | awk '{if(NR>2) print $0}' | wc | awk '{print $2}')

case $SW_CASE in
	M)
		printf "%-20s\t%d\n" "Specified year:" $YEAR
		printf "%-20s\t%d\n" "Specified month:" $MONTH
		printf "%-20s\t%d\n" "Num. of days:" $_nofDays
		;;	
	Y)
		printf "%-20s\t%d\n" "Specified year:" $YEAR
		printf "%-20s\t%d\n" "Specified month:" $MONTH
		printf "%-20s\t%d\n" "Num. of days:" $_nofDays
		;;
	YM)
		printf "%-20s\t%d\n" "Specified year:" $YEAR
		printf "%-20s\t%d\n" "Specified month:" $MONTH
		printf "%-20s\t%d\n" "Num. of days:" $_nofDays
		;;
	*)
			echo "Please specify a (y)ear or a (m)onth"
		;;
esac
   	

