#!/bin/bash
# by ian k. bania

# check for triton (hidpi) flag
if [[ "$1" =~ ^([Tt])+$ ]]; then
        rofi_command="rofi -lines 5 -width 600"
else
        rofi_command="rofi -lines 5 -width 400"
fi

A=" Relativty & Cosmology"
B=" Electricity & Magnetism"
C=" Extragalatic Astronomy"
D=" Native Museum Studies"
E=" Ilie Dark Matter Group"


# Variable passed to rofi
options="$A\n$B\n$C\n$D\n$E"

chosen="$(echo -e "$options" | $rofi_command -dmenu -p "zoom links")"
case $chosen in
    $A)
        firefox 
        ;;
    $B)
        firefox 
        ;;
    $C)
        firefox 
        ;;
    $D)
        firefox 
        ;;
    $E)
        firefox 
        ;;
esac

