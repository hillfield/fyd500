#!/usr/bin/env bash
clear

mem=$(free -hm | awk  'NR==2 { print $3}')
swp=$(free -hm | awk  'NR==3 { print $3}')

printf "\$HOME\t\t=%s\n\$SHELL\t\t=%s\nPhys. mem\t=%s\nSwap\t\t=%s\n" \
	"$(pwd)" ${SHELL} ${mem} ${swp}

