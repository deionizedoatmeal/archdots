#!/bin/bash
# copies file $1 to $2 and uncomments the section after the string $0 terminating on a newline

# copy the file
cp $2 $3
echo "copied"


if [[ "$1" =~ ^([Tt])+$ ]]; then
        sed -i -e 's/^#T //g' $3

elif [[ "$1" =~ ^([Nn])+$ ]]; then
        sed -i -e 's/^#N //g' $3
fi

