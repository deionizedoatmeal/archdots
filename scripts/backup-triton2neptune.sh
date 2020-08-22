#!/bin/bash
# takes the input as a name of a directory
# looks for that directory on neptune
# does an rsync -au from triton > neptune
# will copy files from source, but skip any file that is newer on the destination


if [ -d "${1}" ]; then
        rsync -au ${1} neptune:${1}
else
        echo "Directory does not exist."
fi
