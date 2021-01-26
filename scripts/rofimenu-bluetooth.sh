#!/bin/bash

# check for triton (hidpi) flag
if [[ "$1" =~ ^([Tt])+$ ]]; then
        ROFI_COMMAND="rofi -lines 5 -width 450"
else
        ROFI_COMMAND="rofi -lines 5 -width 250"
fi

### Options ###
ZERO=" power toggle"

if [ "$(bluetoothctl info D8:AF:F1:A9:BE:D7 | sed -n -e 's/^.*Connected: //p')" == "yes" ]
then
    FIRST=" headphones <-"
else
    FIRST=" headphones"
fi

if [ "$(bluetoothctl info D1:64:9F:2F:F5:D3 | sed -n -e 's/^.*Connected: //p')" == "yes" ]
then
    SECOND=" earbuds <-"
else
    SECOND=" earbuds"
fi

if [ "$(bluetoothctl info 88:C6:26:21:AA:32 | sed -n -e 's/^.*Connected: //p')" == "yes" ]
then
    THIRD="醙 speaker <-"
else
    THIRD="醙 speaker"
fi


if [ "$(bluetoothctl info DC:2C:26:EE:7E:FA | sed -n -e 's/^.*Connected: //p')" == "yes" ]
then
    FOURTH=" keyboard <-"
else
    FOURTH=" keyboard"
fi



# Variable passed to rofi
OPTIONS="$ZERO\n$FIRST\n$SECOND\n$THIRD\n$FOURTH"

STATUS=$(bluetoothctl show | sed -n -e 's/^.*Powered: //p')
if [ "$STATUS" == "no" ]
then
#   echo "its off 1" 
   ONOFF="off"
else
#    echo "its on 2"
    ONOFF="on"
fi


CHOSEN="$(echo -e "$OPTIONS" | $ROFI_COMMAND -dmenu -p "bluetooth $ONOFF" -selected-row 0)"
case $CHOSEN in
    $ZERO)
        bluetooth-power-toggle
        ;;
    $FIRST)
        if [ "$STATUS" == "no" ]; then
            bluetooth-power-toggle
        fi
        bluetooth-device-toggle D8:AF:F1:A9:BE:D7
        ;;
    $SECOND)
        if [ "$STATUS" == "no" ]; then
            bluetooth-power-toggle
        fi
        bluetooth-device-toggle D1:64:9F:2F:F5:D3
        ;;
    $THIRD)
        if [ "$STATUS" == "no" ]; then
            bluetooth-power-toggle
        fi
        bluetooth-device-toggle 88:C6:26:21:AA:32
        ;;
    $FOURTH)
        if [ "$STATUS" == "no" ]; then
            bluetooth-power-toggle
        fi
        bluetooth-device-toggle DC:2C:26:EE:7E:FA
        ;;
esac

