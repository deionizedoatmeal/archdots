#!/bin/bash

#STATUS=""
#if [ "$(bluetoothctl info | sed -n -e 's/^.*Connected: //p')" == "yes" ]; then
#    STATUS=""
#fi
#if [ "$(bluetoothctl show | sed -n -e 's/^.*Powered: //p')" == "no" ]; then
#    STATUS=""
#fi
#ONE=""
#TWO=""
#THREE=""
#BAR=""
#if [ "$(bluetoothctl info D8:AF:F1:A9:BE:D7 | sed -n -e 's/^.*Connected: //p')" == "yes" ]; then
#	ONE=""
#    BAR="|"
#fi
#if [ "$(bluetoothctl info D1:64:9F:2F:F5:D3 | sed -n -e 's/^.*Connected: //p')" == "yes" ]; then
#	TWO=""
#    BAR="|"
#fi
#if [ "$(bluetoothctl info 88:C6:26:21:AA:32 | sed -n -e 's/^.*Connected: //p')" == "yes" ]; then
#	THREE=" 醙"
#    BAR="|"
#fi
#echo $ONE$TWO$THREE$BAR$STATUS


ONE=""
TWO=""
THREE=""

# bluetooth off
if [ "$(bluetoothctl show | sed -n -e 's/^.*Powered: //p')" == "no" ]; then
    echo ""
    
# bluetooth connected
elif [ "$(bluetoothctl info | sed -n -e 's/^.*Connected: //p')" == "yes" ]; then
    # headphones
    if [ "$(bluetoothctl info D8:AF:F1:A9:BE:D7 | sed -n -e 's/^.*Connected: //p')" == "yes" ]; then
	    ONE=""
    fi  
    # earbuds
    if [ "$(bluetoothctl info D1:64:9F:2F:F5:D3 | sed -n -e 's/^.*Connected: //p')" == "yes" ]; then
	    TWO=""
    fi
    # speaker
    if [ "$(bluetoothctl info 88:C6:26:21:AA:32 | sed -n -e 's/^.*Connected: //p')" == "yes" ]; then
	    THREE=" 醙"
    fi

    # if device is connected, but doesn't have an icon
    LIST=$(echo $ONE$TWO$THREE)
    if [[ "$LIST" == "" ]]; then
        echo ""
    # if there is a icon
    else
        echo $ONE$TWO$THREE
    fi

# on but not connected
else
    echo ""
fi




