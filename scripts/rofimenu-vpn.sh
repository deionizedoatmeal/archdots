#!/bin/bash

# check for triton (hidpi) flag
if [[ "$1" =~ ^([Tt])+$ ]]; then
        rofi_command="rofi -lines 3 -width 600"
else
        rofi_command="rofi -lines 3 -width 400"
fi

### Options ###
# MSG=$(protonvpn s)
# STATUS=$(echo $MSG | grep -o '^...........')
# STATUS=$(ps -ax | grep -w "vpn-connect" | wc -l)
STATUS=$(ps -ax | grep -w "openconnect" | wc -l)
# IP=$(echo $MSG | awk '/IP:/ {match($0, /IP:/); print substr($0, RSTART + 3, RLENGTH + 11);}')

# if [ "$STATUS" == "Status: Con" ]
if [ "$STATUS" = "1" ] || [ "$STATUS" = "0" ]
then
	zero=" connect vpn (split)"
	second=" connect vpn (full)"
	first=" vpn disconnected <-"
else
	zero=" vpn connected <-"
	first=" disconnect vpn"
	second=""
fi


# Variable passed to rofi
options="$first\n$zero\n$second"

# chosen="$(echo -e "$options" | $rofi_command -dmenu -p "vpn$IP" -selected-row 2)"
chosen="$(echo -e "$options" | $rofi_command -dmenu -p "vpn" -selected-row 2)"
case $chosen in
    $zero)
        # sudo protonvpn -f c
        vpn-connect
        ;;
    $second)
        # sudo protonvpn -f c
        vpn-connect-full
        ;;
    $first)
        # sudo protonvpn d
        vpn-disconnect
esac

