#!/bin/bash
# by ian k. bania

# check for triton (hidpi) flag
if [[ "$1" =~ ^([Tt])+$ ]]; then
        rofi_command="rofi -lines 6 -width 500"
else
        rofi_command="rofi -lines 6 -width 300"
fi

PS=" Planetary Science"
FLUIDS=" Fluid Mechanics"
TG=" Dark Matter Group"
TWO=" 2's Office"
ONE=" 1's Office"
DEPT=" 410 Group Meeting"



# Variable passed to rofi
options="$PS\n$FLUIDS\n$TG\n$LEVINE\n$TSENG\n$DEPT"

chosen="$(echo -e "$options" | $rofi_command -dmenu -p "zoom links")"
case $chosen in
    $PS)
        firefox # ZOOM link here
        ;;
    $FLUIDS)
        firefox # ZOOM link here
        ;;
    $TWO)
        firefox # ZOOM link here
        ;;
    $ONE)
        firefox # ZOOM link here
        ;;
    $TSENG)
        firefox # ZOOM link here
        ;;
    $DEPT)
        firefox # ZOOM link here
        ;;
esac

