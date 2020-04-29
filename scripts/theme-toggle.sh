#!/bin/bash
# toggles light dark theme without changing the background
# uses pywal


### PYWAL ###
IMG=$(cat ~/.fehbg | sed -n -e 's/^.*--bg-fill //p')
IMG="${IMG#?}"; IMG="${IMG%?}"; IMG="${IMG%?}"
THEME=$(head -1 ~/.cache/wal/colors | cut -c 2-2)

if [[ ${THEME} == "f" ]]; then
        wal -i ${IMG}
        cp ${HOME}/.config/gtk-3.0/dark.ini ${HOME}/.config/gtk-3.0/settings.ini
        cp ${HOME}/.config/gtk-4.0/dark.ini ${HOME}/.config/gtk-4.0/settings.ini
        cp ${HOME}/.gtkrc-2.0.dark ${HOME}/.gtkrc-2.0
else
        wal -i ${IMG} -l
        cp ${HOME}/.config/gtk-3.0/light.ini ${HOME}/.config/gtk-3.0/settings.ini
        cp ${HOME}/.config/gtk-4.0/light.ini ${HOME}/.config/gtk-4.0/settings.ini
        cp ${HOME}/.gtkrc-2.0.light ${HOME}/.gtkrc-2.0
fi


### ZATHURA ###
# check how many zathura windows are open
ZATH=$(ps aux | grep 'zathura' | wc -l)

ZATH=$(($ZATH - 1))

# close them
killall -q zathura

# if zathura was open
if [[ ${ZATH} -gt 0 ]]; then

        # get zathura history
        HIST=$(cat ${HOME}/.local/share/zathura/history)
        
        # find the files that were last open and open them
        for j in $ZATH; do
                FILE=${HIST##*[}
                FILE=${FILE%]*}
                HIST=${HIST%%[*}
                (zathura ${FILE} &> /dev/null &)

        done
fi

exit 0
