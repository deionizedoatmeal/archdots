#!/bin/bash

shopt -s nullglob globstar

# get all the saved password files
PREFIX=${PASSWORD_STORE_DIR-~/.password-store}
PASSWORD_FILES=( "$PREFIX"/**/*.gpg )
PASSWORD_FILES=( "${PASSWORD_FILES[@]#"$PREFIX"/}" )
PASSWORD_FILES=( "${PASSWORD_FILES[@]%.gpg}" )

# shows a list of all password files and saved the selected one in a variable
PASSWORD=$(printf '%s\n' "${PASSWORD_FILES[@]}" | rofi -p "pass" -dmenu "$@")
[[ -n $PASSWORD ]] || exit

METHOD=$(printf "autotype\npassword\nusername" | rofi -p "pass" -dmenu "$@")
[[ -n $METHOD ]] || exit

if [ ${METHOD} == "autotype" ]; then
    PASSW=$(pass show $PASSWORD)
    UNAME=$(echo $PASSWORD | sed 's:.*/::')
    xdotool type "$UNAME"
    xdotool key Tab
    xdotool type "$PASSW"
    xdotool key Tab

elif [ ${METHOD} == "password" ]; then
    PASSW=$(pass show $PASSWORD)
    xdotool type "$PASSW"
    xdotool key Tab
    
elif [ ${METHOD} == "username" ]; then
    UNAME=$(echo $PASSWORD | sed 's:.*/::')
    xdotool type "$UNAME"
    xdotool key Tab

fi

