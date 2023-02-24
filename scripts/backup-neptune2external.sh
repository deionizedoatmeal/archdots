#!/bin/bash

# game saves
#

if [ "$EUID" -eq 0 ]; then 
        echo "Please do not run as root"
        exit
fi

echo \ 
lsblk
echo \ 
read -r -p "IS EVERYTHING MOUNTED THAT NEEDS TO BE??? [y/N]" response

if [[ "$response" =~ ^([Yy])+$ ]]; then
        # copy my civ saves over lol
        # cp -r ${HOME}/.local/share/aspyr-media/Sid\ Meier\'s\ Civilization\ VI/Saves Steam/saves    
        # backup system
        sudo rdiff-backup -v5 --print-statistics --exclude '/home/ian/.cache' --exclude '/home/ian/Media' --exclude '/home/ian/Backups/neptune' /home/ian/ /mnt/external/
fi
