#!/bin/bash

# check for triton (hidpi) flag
if [[ "$1" =~ ^([Tt])+$ ]]; then
        rofi_command="rofi -lines 8 -width 400"
else
        rofi_command="rofi -lines 8 -width 250"
fi


### Options ###
dl=" downloads"
rp=" repos"
sch=" school"
dm=" dark matter"
d="﬌  docs"
n="﬌  notes"
p="﬌  papers"
t=" texts"
# Variable passed to rofi
options="$dl\n$rp\n$sch\n$dm\n$d\n$n\n$p\n$t"

chosen="$(echo -e "$options" | $rofi_command -dmenu -p "open" -selected-row 1)"
case $chosen in
    $dl)
        kitty ranger ~/Downloads > /dev/null 2>&1
        ;;
    $rp)
        kitty ranger ~/Repos > /dev/null 2>&1
        ;;
    $sch)
        kitty ranger ~/School > /dev/null 2>&1
        ;;
    $dm)
        kitty ranger ~/Research/dark_matter > /dev/null 2>&1
        ;;
    $p)
        kitty ranger ~/Research/dark_matter/papers > /dev/null 2>&1
        ;;
    $d)
        kitty ranger ~/Research/dark_matter/docs > /dev/null 2>&1
        ;;
    $n)
        kitty ranger ~/Research/dark_matter/notes > /dev/null 2>&1
        ;;
    $t)
        kitty ranger ~/Documents/texts > /dev/null 2>&1
        ;;
esac

