#!/bin/bash

# VOL=$(pacmd dump-volumes | awk 'NR==1{print $8}' | sed 's/\%//')
# SINKS=$(pacmd dump-volumes | grep -Eo "Sink.{0,3}" | cut -b 6-7 | cut -d ":" -f1)
SINKS=$(pacmd dump-volumes | grep -E "Sink" | cut -f1 -d ":" | cut -f2 -d " ")
VOL=$(pacmd dump-volumes | grep -E $SINKS | cut -f1 -d "%" | awk -F'. ' ' {print $NF}' | cut -f2 -d " ")

if [[ $VOL -lt 100 ]]; then
    for I in $SINKS; do
        (pactl set-sink-volume $I +5%)
    done
fi

VOL=$(pacmd dump-volumes | awk 'NR==1{print $8}' | sed 's/\%//')

notify-send "墳 $VOL" -h string:x-canonical-private-synchronous:anything
