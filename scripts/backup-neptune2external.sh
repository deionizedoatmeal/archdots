#!/bin/bash

# game saves
cp -ru .local/share/aspyr-media/ Steam/.
cp -ru .local/share/Euro\ Truck\ Simulator\ 2/ Steam/.

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
        sudo rdiff-backup -v5 --print-statistics --exclude '/home/ian/.*' /home/ian/ /mnt/external/
fi
