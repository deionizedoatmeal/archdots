#!/bin/bash
# does an rsync -au from $2 > this machine
# will copy files from $2, but skip any file that is newer on this machine


if [ -d "${1}" ]; then
        rsync -au ${2}:${1} .
else
        echo "Directory does not exist."
fi
