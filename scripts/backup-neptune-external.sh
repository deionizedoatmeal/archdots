#!/bin/bash

echo \ 
lsblk
echo \ 
read -r -p "IS EVERYTHING MOUNTED THAT NEEDS TO BE??? [y/N]" response
if [[ "$response" =~ ^([Yy])+$ ]]; then
        # copy my civ saves over lol
        cp -r ${HOME}/.local/share/aspyr-media/Sid\ Meier\'s\ Civilization\ VI/Saves Steam/saves    
        # backup system
        sudo rdiff-backup -v5 --exclude '/home/ian/.*' /home/ian/ /mnt/external/
fi
