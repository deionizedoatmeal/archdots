#!/bin/bash
#meant to be run from a script module in polybar with the added option of:
#
# on click it will toggle thru the various options 



# if load percent


# if clock speed
c=0;t=0
awk '/MHz/ {print $4}' < /proc/cpuinfo | (while read -r i
do
    t=$( echo "$t + $i" | bc )
    c=$((c+1))
done
echo "scale=2; $t / $c / 1000" | bc | awk '{print "|"$1"GHz"}')


# if temp:
sensors | sed -rn 's/.*Core 0:\s+.([0-9.]+).*/\1/p'

exit 0
