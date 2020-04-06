#!/bin/bash
# by Ian K. Bania 
# Jan '20
# NOTE: the user who executes this script needs to be able to execute sudo system76-power without being prompted for a password. This isn't the case on ubuntu, but is on arch, check my sudoers for details.

profile="$(sudo system76-power profile | sed -n -e 's/^.*Profile: //p')"

if [ "$profile" = "Battery" ]
then
    echo "|"
fi

if [ "$profile" = "Balanced" ]
then
    echo "|"
fi

if [ "$profile" = "Performance" ]
then
    echo "|"
fi


