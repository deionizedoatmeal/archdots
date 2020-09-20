#!/bin/bash

# bluetooth status on
STATUS=""

# bluetooth connected
if [ "$(bluetoothctl info | sed -n -e 's/^.*Connected: //p')" == "yes" ]; then
    STATUS=""
fi

# bluetooth off
if [ "$(bluetoothctl show | sed -n -e 's/^.*Powered: //p')" == "no" ]; then
    STATUS=""
fi


# device icon
ONE=""
TWO=""
THREE=""
BAR=""

#headphones
if [ "$(bluetoothctl info D8:AF:F1:A9:BE:D7 | sed -n -e 's/^.*Connected: //p')" == "yes" ]; then
	ONE=""
    BAR="|"
fi
 
#earbuds
if [ "$(bluetoothctl info D1:64:9F:2F:F5:D3 | sed -n -e 's/^.*Connected: //p')" == "yes" ]; then
	TWO=""
    BAR="|"
fi

#speaker
if [ "$(bluetoothctl info 88:C6:26:21:AA:32 | sed -n -e 's/^.*Connected: //p')" == "yes" ]; then
	THREE=" 醙"
    BAR="|"
fi

echo $ONE$TWO$THREE$BAR$STATUS


