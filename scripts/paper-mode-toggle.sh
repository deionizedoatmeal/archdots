#!/bin/bash
# by ian k. bania 
# feb '20

# get the info from i3wm
I3MSG=$(i3-msg -t get_tree)

# check to see what dispaly its on
DELIM='"focused":true'
LONGDISP=${I3MSG##*${DELIM}}
DELIM=',"layout":'
DISP=${LONGDISP%%${DELIM}*}
DELIM='"output":'
WORD=${DISP##*${DELIM}}
DELIM='"'
WORD=${WORD#*${DELIM}}
DELIM='"'
DISPLAY=${WORD%${DELIM}*}
DELIM='-'
HDMI=${DISPLAY%%${DELIM}*}

# check to see what the right gaps are set to
DELIM='"focused":true'
FOCUSED=${I3MSG%%${DELIM}*}
GAPS=${FOCUSED##*gaps}
DELIM='"right":'
RIGHT=${GAPS##*${DELIM}}
RIGHTVALUE=${RIGHT%%,*}


if [[ ${RIGHTVALUE} -eq 0 ]]; then
    if [[ $HDMI == "HDMI" ]]; then
        i3-msg split v;
        i3-msg gaps right current set 100;
        i3-msg gaps left current set 100;
        i3-msg gaps top current set 300;
        i3-msg gaps bottom current set 300;
    elif [[ ${DISPLAY} == "DisplayPort-1" ]]; then
        i3-msg split v;
        i3-msg gaps right current set 100;
        i3-msg gaps left current set 100;
        i3-msg gaps top current set 300;
        i3-msg gaps bottom current set 300;
    else
        i3-msg split v;
        i3-msg gaps right current set $1;
        i3-msg gaps left current set $1;
        i3-msg gaps top current set $2;
        i3-msg gaps bottom current set $3;
    fi
else
    i3-msg split h;
    i3-msg gaps right current set 0;
    i3-msg gaps left current set 0;
    i3-msg gaps top current set 35;
    i3-msg gaps bottom current set 0;
    i3-msg split h;
fi
