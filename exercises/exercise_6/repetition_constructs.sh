#!/usr/bin/env bash

# 
_msg_help="The script will print home path [-o], current shell[-s], free memory[-m], swap space[-w] etc. Alternatively, one can use --home, --shell, --mem, --help"
_msg_empty="Please supply an input argument, see --help for all alternatives."
_msg_error="Error, please see --help for available flags."

# Unset parameters
unset h s m p help

## Assign mem and swp to free memory and swap
_mem=$(free -hm | awk  'NR==2 { print $3}')
_swp=$(free -hm | awk  'NR==3 { print $3}')
_home=$(pwd)
_csh=${SHELL}

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
		"o") printf "%-6s\t%-8s\n" "HOME:"	"${_home}";;
		"s") printf "%-6s\t%-8s\n" "SHELL:"	"${_csh}";;
		"m") printf "%-6s\t%-8s\n" "MEM:"	"${_mem}";;
		"w") printf "%-6s\t%-8s\n" "SWAP:"	"${_swp}";;
		"h") clear; echo ${_msg_help};;
		"") clear;  printf "%s" "${_msg_empty}";exit 1;;
		"?") clear;	printf "%s" "${_msg_error}";exit 2;;
	esac
done 
shift $(expr $_flags - 1)
exit 0
