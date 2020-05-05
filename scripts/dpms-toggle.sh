#!/bin/bash  

if [ "$(xset -q | tail -1)" == "  DPMS is Disabled" ]; then
        xset +dpms
else
        xset -dpms
fi

xset -q

