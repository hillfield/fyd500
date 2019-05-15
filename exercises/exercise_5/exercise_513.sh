#!/usr/bin/env bash
#set -x


# Initializing variables
VAR1="thirteen"
VAR2="13"
VAR3="Happy Birthday"

export ${VAR1}
#export ${VAR2}

echo $VAR1
echo $VAR2
echo $VAR3

unset VAR3

echo $VAR1
echo "========================"
bash -c "echo \$VAR1"
echo "-----------------------"
bash -c "echo $VAR1"
#bash -c "echo $VAR1"

