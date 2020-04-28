#!/bin/bash

(wal -i "$(< "${HOME}/.cache/wal/wal")")

# terminate already running bar instances
killall -q polybar

# wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# launch bars
polybar main &
polybar secondary &

