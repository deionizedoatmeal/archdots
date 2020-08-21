#!/bin/bash

cd ${HOME}/.local/share/dijo
git init

read -r -p "What is the full path of the bare git repository?" PATH

read -r -p "Remote [R] or local [L] ?" RESPONSE

if [[ "$RESPONSE" =~ ^([Rr])+$ ]]; then
        read -r -p "What is the SSH login to the remote machine? (i.e. ian@neptune, ian@192.168.0.1, or neptune)" SSH
        git remote add origin ${SSH}:${PATH}

elif [[ "$response" =~ ^([Ll])+$ ]]; then
        git remote add origin ${PATH}
else
        echo "Invalid reponse."
        set -e 
fi

git config pull.rebase false
git pull origin master --allow-unrelated-histories

