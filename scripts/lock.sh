#!/bin/bash  

# make sure screenblanking is turned off
if [ "$(xset -q | tail -1)" == "  DPMS is Disabled" ]; then
        xset +dpms
fi

gllock
