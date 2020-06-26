#!/bin/bash
# modifed from https://gitlab.com/jennydaman/PigeonStats, all credit to them

uptime --pretty

clear=$(tput sgr0)
last_pac=$(tac /var/log/pacman.log | grep -m1 -F "[PACMAN] starting full system upgrade" | cut -d "[" -f2 | cut -d "]" -f1)
time_since=$((($(date +%s)-$(date --date="$last_pac" +%s))/3600))
echo "It has been $(tput bold)$time_since hour$([ $time_since -ne 1 ] && echo s)$clear since your last $(tput setaf 6)pacman -Syu$clear"


