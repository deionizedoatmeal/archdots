#!/bin/bash

SINKS=$(pacmd dump-volumes | grep -E "Sink" | cut -f1 -d ":" | cut -f2 -d " ")


for I in $SINKS; do
    (pactl set-sink-volume $I -5%)
done

VOL=$(pacmd dump-volumes | awk 'NR==1{print $8}' | sed 's/\%//')
notify-send "墳 $VOL" -h string:x-canonical-private-synchronous:anything 
