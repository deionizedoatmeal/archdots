#!/bin/bash
# this garbage was written by ian k. bania in jan '20
# takes the device address as an argument, toggles the connection

ADDRESS=$1

I=0


#echo $(bluetoothctl info $address | sed -n -e 's/^.*Connected: //p')

if [ "$(bluetoothctl info $ADDRESS | sed -n -e 's/^.*Connected: //p')" == "yes" ]; then
#    echo "connected, going to disconnect"
    bluetoothctl disconnect $ADDRESS
else
#    echo "not connected, going to connect"
    while [ "$(bluetoothctl info $ADDRESS | sed -n -e 's/^.*Connected: //p')" == "no" ]; do
        bluetoothctl connect $ADDRESS
        sleep 2
        ((I++))
        
        if [ "$(bluetoothctl info $ADDRESS | sed -n -e 's/^.*Connected: //p')" == "yes" ]; then
            break
        fi

        if [[ "$I" == '10' ]]; then
            break
        fi
    done
fi



