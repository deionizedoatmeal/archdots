#!/bin/bash
# modifed from https://gitlab.com/jennydaman/PigeonStats, all credit to them

cd "${BASH_SOURCE%/*}" || exit
printf "\n"
neofetch
printf "\n"
allfetch-temp
printf "\n"
allfetch-proc
printf "\n"
allfetch-update
printf "\n"
journalctl -p err..alert | tail -n 15
printf "\n"

