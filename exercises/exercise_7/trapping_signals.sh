#/bin/bash
# Ctrl+C is the same thing as SIGSTOP
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
		break
	fi	
}

# Main script
sleep 3600 &
sleep 3600 &
while :
do
	wait
done
