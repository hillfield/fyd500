#/bin/bash
# Ctrl+C is the same thing as SIGSTOP
trap exit 0 EXIT

trap 'sleep_trapping' SIGSTOP SIGINT

sleep_trapping() {
	echo -e "User interupted the script\nDo you want to continue? (Y/N)"
	
	read user_input
	echo "--------------->${user_input,,}"
	if [[ "${user_input,,}" == "y" ]]
	then
		echo "Continuing..."
	else
		echo "Good bye..."
		exit 0
	fi	
}

# Main script
while :
do
	sleep 15 &
	sleep 15 &
	wait
done
