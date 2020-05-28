#!/bin/bash

if [ "$(xset -q | tail -1)" == "  DPMS is Disabled" ]; then
        echo "|精"
else
        echo ""
fi
