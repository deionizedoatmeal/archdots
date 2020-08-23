#!/bin/bash

# move the the directory the script is in
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd $DIR

read -r -p "What email address would you like to use with pass? " EMAIL
read -r -p "What is the full path of the bare git repository? " PATH

pass init $EMAIL
pass git init

read -r -p "Remote [R] or local [L]? " RESPONSE

if [[ "$RESPONSE" =~ ^([Rr])+$ ]]; then
        read -r -p "What is the SSH login to the remote machine? (i.e. ian@neptune, ian@192.168.0.1, or neptune) " SSH
        pass git remote add origin ${SSH}:${PATH}

elif [[ "$response" =~ ^([Ll])+$ ]]; then
        pass git remote add origin ${PATH}

else
        echo "Invalid reponse."
        set -e 
fi

pass git pull origin master --allow-unrelated-histories
pass git config pull.rebase false

cp ../system/gpg-agent.conf ${HOME}/.gnupg/.


read -r -p "Would you like to import gpg keys? [y/N] " RESPONSE

if [[ "$RESPONSE" =~ ^([Yy])+$ ]]; then
        read -r -p "What is the path to the key? " KEYPATH
        gpg2 --import ${KEYPATH}
        read -r -p "What is the name of the key? " NAME
        echo "Once in gpg2, run the command 'trust', follow directions, then quit."
        gpg2 --edit-key ${NAME}
else
        set -e 
fi
