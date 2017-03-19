#! /bin/bash
# Backup script for Gentoo Linux
# Author: nianderson
# Date: 2004.09.15.
#


#Used to install a stage4 created with mkstage4.sh
#assumes you have already partitioned and formated your drive
#assumes your booted from gentoo live cd
#assumes you already decrypted your *.gpg archive (#gpg stage4.tar.bz2.gpg)

#Define Disk layout
#if using ide disks use hdax if using scsi use sdax

rootPartition=/dev/sda6
bootPartition=/dev/sda1

#where to mount the disk partitions
mntRootPartition=/mnt/gentoo
mntBootPartition=/mnt/gentoo/boot

#URL of stage4
#I put a copy of the tar on a webserver so i can
#easily get it when a reinstall is needed
urlToStage4=http://192.168.2.111/
stage4=zmtux-stage4-16.01.2009-custom.tar.bz2

#mount root partition
echo mounting root partition $rootPartition to $mntRootPartition
mount $rootPartition $mntRootPartition
sleep 5
echo

#not sure about this part yet
#wget the stage4 to the mounted root partition
cd $mntRootPartition
echo wget $urlToStage4$stage4 to $mntRootPartition
wget $urlToStage4$stage4
sleep 5

#untar the stage4
echo extract stage4
tar xjpf $stage4
sleep 5

echo

#mount boot partiton
#echo mounting $bootPartition to $mntBootPartition
#mkdir $mntbootPartition
#mount $bootPartition $mntBootPartition
#sleep 5
#echo

#copy boot copy back to boot
#echo copy bootcpy back to boot
#cp -R $mntRootPartition/bootcpy $mntBootPartition
#sleep 5

#remove stage4 file
rm -rf $mntRootPartition/$stage4

echo you need to check your fstab and install grub or lilo then
echo all should be well

#echo Removing bootcpy
#rm -rf /bootcpy
echo Enjoy
