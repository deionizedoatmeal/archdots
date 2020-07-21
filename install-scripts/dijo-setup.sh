#!/bin/bash

cd ${HOME}/.local/share/dijo
git init

read -r -p "Remote [R] or local [L] ?" RESPONSE

if [[ "$RESPONSE" =~ ^([Rr])+$ ]]; then
        git remote add origin ian@neptune:/home/ian/Repos/dijo
elif [[ "$response" =~ ^([Ll])+$ ]]; then
        git remote add origin /home/ian/Repos/dijo
else
        echo "Invalid reponse."
        set -e 
fi

git config pull.rebase false
git pull origin master --allow-unrelated-histories

