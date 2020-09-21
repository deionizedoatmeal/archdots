#!/bin/bash


if [ "$(xset -q | tail -1)" == "  DPMS is Disabled" ]; then
        echo "精"
else
        pgrep -x redshift >/dev/null && echo "" || echo ""
fi

