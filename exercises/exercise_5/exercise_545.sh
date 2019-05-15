#!/usr/bin/bash
#!/usr/bin/bash
 #This script will test if we're in a leap year or not.
 
#year=$(date +%Y)

if [[ $# != 1 ]]; then
    echo "Only one input parameter is allowed.\n"; exit;
else
    daemon=$1;
    echo "You specified \"$daemon\""
fi

nofDaemons=$(ps -aef | awk '{print $8}' | grep -cE '\<$daemon')
echo "${daemon}"
case $daemon in
	httpd)
		if [[ -z $nofDaemons ]]; then
			echo "The computer is running a webserver"
		fi	
		;;

	systemd)
		if [[ -z $nofDaemons ]]; then
			echo "The computer is running a systemd"
		fi	

		;;
esac





