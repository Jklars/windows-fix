#!/bin/bash

echo Starting Backup
echo Detecting Data Partition Position
sudo fdisk -l | grep msftdata >> msftdata

python3 givepos.py 0

export MSFTDATA=(<msftdata)

echo Mounting Data Partition
mkdir /mnt/msftdata && sudo mount /dev/sda$MSFTDATA /mnt

mkdir ~/msbackup

echo Copying Files
cp -v /mnt/msftdata/* ~/msbackup

echo Unmounting Data Partition
sudo umount /dev/sda$MSFTDATA
