#!/bin/bash

echo '############################################'
echo
echo '      __        __ ____ _ '
echo '      \ \      / /  ___| |'    
echo '       \ \ /\ / /| |_  | |'    
echo '        \ V  V / |  _| | |___' 
echo '         \_/\_/  |_|   |_____|'
echo 
echo '          WINDOWS FIXER TOOL'
echo '       If you dont have Windows'
echo '    You wont have Windows problems'
echo
echo '############################################'

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