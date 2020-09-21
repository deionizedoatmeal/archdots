#!/bin/bash

E=$(nmcli device status | tail -n +2 | sed -n 's/.*ethernet  //p' | cut -d ' ' -f 1)
W=$(nmcli device status | tail -n +2 | sed -n 's/.*wifi      //p' | cut -d ' ' -f 1)


if [[ $E == "connected" ]]; then
    echo 
elif [[ $W == "connected" ]]; then
    echo 直
else
    echo 睊 
fi

