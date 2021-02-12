#!/bin/bash
# takes the $1 input as a name of a directory
# $2 as the name of the destination machine
# looks for that directory on $2
# does an rsync -au from this machine > $2
# will copy files from this machine, but skip any file that is newer on $2


if [ -d "${1}" ]; then
        rsync -au ${1} ${2}:.
else
        echo "Directory does not exist."
fi
