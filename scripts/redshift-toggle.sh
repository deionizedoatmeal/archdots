#!/bin/bash

if pgrep -x "redshift" >/dev/null
then
    killall redshift
else
    setsid redshift -l ${1} &> /dev/null
fi
exit 0
