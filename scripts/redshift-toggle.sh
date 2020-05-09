#!/bin/bash

if pgrep -x "redshift" >/dev/null
then
    killall -q redshift
else
    setsid redshift -l 46:123 & > /dev/null
fi
