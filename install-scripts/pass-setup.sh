#!/bin/bash

pass init ian.k.bania@gmail.com
pass git init
read -r -p "Remote [R] or local [L] ?" RESPONSE

if [[ "$RESPONSE" =~ ^([Rr])+$ ]]; then
        pass git remote add origin ian@neptune:/home/ian/Repos/pass
elif [[ "$response" =~ ^([Ll])+$ ]]; then
        pass git remote add origin /home/ian/Repos/pass
else
        echo "Invalid reponse."
        set -e 
fi

pass git pull origin master --allow-unrelated-histories

cp ../system/gpg-agent.conf ${HOME}/.gnupg/.
