#!/bin/bash

# check for triton (hidpi) flag
if [[ "$1" =~ ^([Tt])+$ ]]; then
        rofi_command="rofi -lines 4 -width 350"
else
        rofi_command="rofi -lines 4 -width 200"
fi


### Options ###
power_off=" poweroff"
reboot=" reboot"
lock=" lock"
log_out=" logout"
# Variable passed to rofi
options="$power_off\n$reboot\n$lock\n$log_out"

chosen="$(echo -e "$options" | $rofi_command -dmenu -p "session" -selected-row 2)"
case $chosen in
    $power_off)
        sudo systemctl poweroff
        ;;
    $reboot)
        sudo systemctl reboot
        ;;
    $lock)
        gllock
        ;;
    $log_out)
        i3-msg exit && killall -u ian
        #killall -q redshift
        #killall -q polybar
        #killall -q compton
        ;;
esac

