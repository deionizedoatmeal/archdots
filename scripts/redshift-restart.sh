#!/bin/bash


killall -w redshift
setsid redshift -l ${1} &> /dev/null

# WHY CANT I KILL THIS SCRIPT
#(killall redshift-restart) &


