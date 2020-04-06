#!/bin/bash
# by ian k. bania
# feb '20
# NOTE: the user who executes this script needs to be able to execute sudo rfkill without being prompted for a password. This isn't the case on ubuntu, but is on arch, check my sudoers for details.

status=$(bluetoothctl show | sed -n -e 's/^.*Powered: //p')

if [ "$status" == "no" ]
then
    sudo rfkill unblock bluetooth
    bluetoothctl power on
else
    bluetoothctl power off
    sudo rfkill block bluetooth
fi

