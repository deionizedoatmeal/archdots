#!/bin/bash

# check for triton (hidpi) flag
if [[ "$1" =~ ^([Tt])+$ ]]; then
        rofi_command="rofi -lines 2 -width 500"
else
        rofi_command="rofi -lines 2 -width 300"
fi

### Options ###
# MSG=$(protonvpn s)
# STATUS=$(echo $MSG | grep -o '^...........')
STATUS=$(ps -ax | grep openconnect | wc -l)
# IP=$(echo $MSG | awk '/IP:/ {match($0, /IP:/); print substr($0, RSTART + 3, RLENGTH + 11);}')

# if [ "$STATUS" == "Status: Con" ]
if [ "$STATUS" = "1" ] || [ "$STATUS" = "0" ]
then
    zero=" connect vpn"
    first=" disconnect vpn <-"
else
    zero=" connect vpn <-"
    first=" disconnect vpn"
fi


# Variable passed to rofi
options="$zero\n$first"

# chosen="$(echo -e "$options" | $rofi_command -dmenu -p "vpn$IP" -selected-row 2)"
chosen="$(echo -e "$options" | $rofi_command -dmenu -p "vpn" -selected-row 2)"
case $chosen in
    $zero)
        # sudo protonvpn -f c
        vpn-connect
        ;;
    $first)
        # sudo protonvpn d
        vpn-disconnect
esac

