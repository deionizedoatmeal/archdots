#!/bin/bash

VOL=$(pacmd dump-volumes | awk 'NR==1{print $8}' | sed 's/\%//')
SINKS=$(pacmd dump-volumes | grep -Eo "Sink.{0,3}" | cut -b 6-7 | cut -d ":" -f1)

if [[ $VOL -lt 100 ]]; then
    for I in $SINKS; do
        (pactl set-sink-volume $I +5%)
    done
fi
#    (pactl set-sink-volume 0 +5%)
#    (pactl set-sink-volume 1 +5%)
#    (pactl set-sink-volume 2 +5%)
#    (pactl set-sink-volume 3 +5%)
#    (pactl set-sink-volume 4 +5%)
#    (pactl set-sink-volume 5 +5%)
#    (pactl set-sink-volume 6 +5%)
#    (pactl set-sink-volume 7 +5%)
#    (pactl set-sink-volume 8 +5%)
#    (pactl set-sink-volume 9 +5%)
#    (pactl set-sink-volume 10 +5%)


VOL=$(pacmd dump-volumes | awk 'NR==1{print $8}' | sed 's/\%//')

notify-send "墳 $VOL" -h string:x-canonical-private-synchronous:anything -u low
