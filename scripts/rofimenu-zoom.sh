#!/bin/bash
# by ian k. bania

# check for triton (hidpi) flag
if [[ "$1" =~ ^([Tt])+$ ]]; then
        rofi_command="rofi -lines 1 -width 600"
else
        rofi_command="rofi -lines 1 -width 400"
fi

A=" Relativty & Cosmology"
B=" Electricity & Magnetism"
C=" Extragalatic Astronomy"
D=" Native Museum Studies"
E=" Ilie Dark Matter Group"


# Variable passed to rofi
options="$E"

chosen="$(echo -e "$options" | $rofi_command -dmenu -p "zoom links")"
case $chosen in
    $A)
        ;;
    $B)
        ;;
    $C)
        ;;
    $D)
        ;;
    $E)
        ;;
esac

