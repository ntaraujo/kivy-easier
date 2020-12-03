#!/bin/sh

PDIR=/root
VALUES=$PDIR/values

if [ "$1" == "help" ]
then
	cat $PDIR/helps/wadb-settings.txt
	exit
fi

echo "Welcome to Kivy Easier!"

ADB="_$1"
while [ $ADB != "_y" -a $ADB != "_n" ]
do
	read -p "Would you like to run automatically adb workarounds? (y/n) " ADB
	ADB="_$ADB"
done

if [ $ADB == "_y" ]
then
	# Get IPv4 with ipconfig and some tricks
	GATEWAY=$(ipconfig.exe | grep -a Gateway | grep -a [0-9]) # Value of the line with the Default Gateway
	LAST=$(ipconfig.exe | awk "/$GATEWAY/{print NR}") # Line which contains this value

	IFS=' '
	IPSTRINGS=$(ipconfig.exe | sed -n "1,${LAST}p" | grep -a IPv4 | cut -d: -f2) # Ipv4 addresses if before the line with the Gateway
	IPARRAY=(${IPSTRINGS[@]})
	unset IFS

    IP=${IPARRAY[-1]} # Last address, so, the IPv4 that is related to the Default Gateway
	IP=$(sed -e "s/\r//g" <<< "$IP")

	RIGHTIP="_$1"
	while [ $RIGHTIP != "_y" -a $RIGHTIP != "_n" ]
	do
		read -p "We are storaging your IP as '$IP', confirm? (y/n) " RIGHTIP
		RIGHTIP="_$RIGHTIP"
	done
	if [ $RIGHTIP == "_n" ]
	then
		read -p "Please paste your IP address here. You can get it typing 'ipconfig' in Windows side. " IP
	fi
	sudo echo $IP > $VALUES/IP

	# The default port
	PORT=5037

	RIGHTPORT="_$1"
	while [ $RIGHTPORT != "_y" -a $RIGHTPORT != "_n" ]
	do
		read -p "We are configuring adb to use port '$PORT', confirm? (y/n) " RIGHTPORT
		RIGHTPORT="_$RIGHTPORT"
	done
	if [ $RIGHTPORT == "_n" ]
	then
		read -p "Type one port for adb to use. The default is 5037. " PORT
	fi
	sudo echo $PORT > $VALUES/PORT

	# Discover current WSL by Kernel version
	VSTRINGS=$(uname -r)

	IFS='.'
	read -a VARRAY <<< "$VSTRINGS"
	unset IFS

	MAJOR=${VARRAY[0]}
	MINOR=${VARRAY[1]}

	if [ $MAJOR -eq 4 -a $MINOR -ge 19 -o $MAJOR -gt 4 ]
	then
		VER=2
	else
		VER=1
	fi

	RIGHTV="_$1"
	while [ $RIGHTV != "_y" -a $RIGHTV != "_n" ]
	do
		read -p "You are using WSL$VER, confirm? (y/n) " RIGHTV
		RIGHTV="_$RIGHTV"
	done
	if [ $RIGHTV == "_n" ]
	then
		read -p "Type the WSL version " VER
	fi

	sudo echo $VER > $VALUES/WSL

	echo "Thanks! The settings have been saved in $VALUES. You can use these with '$PDIR/wadb-run.sh'"
else
	if [ -f $VALUES/IP ]
	then
		sudo rm $VALUES/IP
	fi
	if [ -f $VALUES/PORT ]
	then
		sudo rm $VALUES/PORT
	fi
	if [ -f $VALUES/WSL ]
	then
		sudo rm $VALUES/WSL
	fi
	echo "Ok. The existing settings have been deleted"
fi