#!/bin/bash
# lvm mounting? 


NAME=$(printf ${1} | sed 's:.*/::')

sudo cryptsetup open ${1} ${NAME}
sudo mount /dev/mapper/${NAME} ${2}
