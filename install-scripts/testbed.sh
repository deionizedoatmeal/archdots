#!/bin/bash

# get the UUID for LUKS partition
LUKSUUID="769c4681-f4f6-4dba-bcd7-7ca99a07c365"

# insert that into tempelate for /etc/default/grub
LINEINSERT=$(echo "10iGRUB_CMDLINE_LINUX="cryptdevice=UUID=${LUKSUUID}:cryptlvm root=/dev/vg/root cryptkey=rootfs:/root/secrets/crypto_keyfile.bin"")

sed -i "${LINEINSERT}" /dots/system/grub

# copy /etc/default/grub over
cp -p /dots/system/grub /etc/default/grub
