#!/usr/bin/env bash

# Unset parameters
unset h s m p help

# Get opts does not support long options i.e. --help

for arg in "$@"; do
	shift
	case "$arg" in
		"--home")	set -- "$@" "-o" ;;
		"--shell")	set -- "$@" "-s" ;;
		"--mem")	set -- "$@" "-m" ;;
		"--swap")	set -- "$@" "-w" ;;
		"--help")	set -- "$@" "-h" ;;
		*)			set -- "$@" "$arg" 
	esac
done

# Check 
_flags=1
while getopts "osmwh" opt
do
	case "$opt" in
		"o") echo "o";;
		"s") echo "s";;
		"m") echo "m";;
		"w") echo "w";;
		"h") echo "h";;
		"?") print_usage >&2; exit 1 ;;
	esac
done
shift $(expr $_flags - 1)



## Clear the terminal
#clear
#
## Assign mem and swp to free memory and swap
#mem=$(free -hm | awk  'NR==2 { print $3}')
#swp=$(free -hm | awk  'NR==3 { print $3}')
#
## Print values
#printf "\$HOME\t\t=%s\n\$SHELL\t\t=%s\nPhys. mem\t=%s\nSwap\t\t=%s\n" \
#	"$(pwd)" ${SHELL} ${mem} ${swp}
#
