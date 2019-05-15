#!/bin/bash

#Read users age
echo "Please specify your birthdate in the following format YYYY-MM-DD"
read birthdate

# Number of seconds up until this date, 18 years ago.
_SEC_IN_DAY=86400

# Number of seconds from 1970 -> 21 years ago
LIM21=$(date -d 'now - 21 year' +"%s")

# Number of seconds from 1970 -> $birthdate
ST=$(date -d "$birthdate" +"%s")

# Difference between the two earlier divided by seconds
# per day
DAYS_LEFT=$(( ($ST-$LIM21)/$_SEC_IN_DAY ))


if [[ $ST -lt $LIM21  ]]
then
	echo "Welcome to systembolaget"
else
	printf "Come back in %d days" $DAYS_LEFT
fi

