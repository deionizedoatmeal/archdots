#!/bin/bash

# move the the directory the script is in
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd $DIR

read -r -p "What email address would you like to use with pass?" EMAIL
read -r -p "What is the full path of the bare git repository?" PATH

pass init $EMAIL
pass git init

read -r -p "Remote [R] or local [L] ?" RESPONSE

if [[ "$RESPONSE" =~ ^([Rr])+$ ]]; then
        read -r -p "What is the SSH login to the remote machine? (i.e. ian@neptune, ian@192.168.0.1, or neptune)" SSH
        pass git remote add origin ${SSH}:${PATH}

elif [[ "$response" =~ ^([Ll])+$ ]]; then
        pass git remote add origin ${PATH}

else
        echo "Invalid reponse."
        set -e 
fi

pass git pull origin master --allow-unrelated-histories

cp ../system/gpg-agent.conf ${HOME}/.gnupg/.
