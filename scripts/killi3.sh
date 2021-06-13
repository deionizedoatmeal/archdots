#!/bin/bash
# kills a number of a user space processes so a clean restart may be made
killall polybar &> /dev/null
killall redshift &> /dev/null
killall compton &> /dev/null
killall flashfocus &> /dev/null
killall pulseaudio &> /dev/null
killall dunst &> /dev/null
