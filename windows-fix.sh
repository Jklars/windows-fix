#!/bin/bash

cat << EOF
'############################################'
'         __        __ ____ _ '
'         \ \      / /  ___| |'    
'          \ \ /\ / /| |_  | |'    
'           \ V  V / |  _| | |___' 
'            \_/\_/  |_|   |_____|'
 
'             WINDOWS FIX TOOL'
'          If you dont have Windows'
'       You wont have Windows problems'
'         10 seconds to real freedom'

'############################################'
EOF


function doit {
	ls /sys/firmware/efi/efivars

	export RET=$?

	if [ $RET = 0 ]; then
		echo EFI MODE
		sudo rm -r /boot/EFI/Microsoft
		echo Removed Windows Boot Entries

	else
		echo BIOS MODE
	fi


	sudo fdisk -l | grep bios >> msftres
	sudo fdisk -l | grep msftdata >> msftdata

	python3 givepos.py

	export MSFTRES=$(<msftres)
	export MSFTDATA=$(<msftdata)

	parted /dev/sda rm $MSFTDATA
	parted /dev/sda rm $MSFTRES
}

read -r -p "Do you want to fix Windows problems? [Y/n] " response

if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
then
    doit
else
    exit
fi
