#!/bin/bash

# (wal -i "$(< "${HOME}/.cache/wal/wal")")
(wal -R)


# terminate already running bar instances
killall -q polybar

# wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# launch bars

#TRITON
#T polybar 1800-full &

#NEPTUNE
polybar 1080-date &
#polybar 1080-temp &
#polybar 1080-net &
#polybar 1080-disp &
polybar 1080-nettempdisp &
polybar 1080-btaudio &
#polybar 1080-audio &
#polybar 1080-bt &
polybar 1080-i3 &
# polybar sq-i3 &
# polybar sq-audio &
polybar vert-i3 &
polybar vert-audio &
polybar vert1080-i3 &
polybar vert1080-audio &
