#!/bin/bash

if [[ "$POLYBAR_SYSTEM_DISPLAY_STATE" == "" ]]; then
    POLYBAR_SYSTEM_DISPLAY_STATE="0"
    export $POLYBAR_SYSTEM_DISPLAY_STATE

elif [[ "$polybar_system_display_state" == "0" ]]; then
    POLYBAR_SYSTEM_DISPLAY_STATE="1"
    export $polybar_system_display_state

elif [[ "$POLYBAR_SYSTEM_DISPLAY_STATE" == "1" ]]; then
    POLYBAR_SYSTEM_DISPLAY_STATE="2"
    export $POLYBAR_SYSTEM_DISPLAY_STATE

elif [[ "$POLYBAR_SYSTEM_DISPLAY_STATE" == "2" ]]; then
    POLYBAR_SYSTEM_DISPLAY_STATE="0"
    export $POLYBAR_SYSTEM_DISPLAY_STATE
fi

