#!/bin/bash

if [ -d "${1}" ]; then
        rsync -au ${1} neptune:${1}
else
        echo "Directory does not exist."
fi
