#!/bin/bash
# ian k. bania, may 2020
# script to automate setting up a preboot dropbear ssh server on the ramdisk for the purposes of remote headless disk decryption

# cd into the repository regardless of where script is executed
SCRIPTPATH=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd "$SCRIPTPATH"

# update and install mkinitcpio packages
sudo pacman -Syu
sudo pacman -S --needed mkinitcpio-utils mkinitcpio-dropbear mkinitcpio-netconf

# copy mkinitcpio.conf over
sudo ../system/mkinitcpio.conf.dropbear /etc/mkinitcpio.conf

# pull the kernel parameters from the old grub file
GRUBKERNPARAM=$(cat /etc/default/grub | grep -P "GRUB_CMDLINE_LINUX=")
GRUBKERNPARAM=${GRUBKERNPARAM%?}
GRUBKERNPARAM=$"10i${GRUBKERNPARAM} ip=192.168.0.111:::::eth0:none\""

# insert the IP kernal parameter to the new grub
sudo sed -i '/GRUB_CMDLINE_LINUX=/d' /etc/default/grub
sudo sed -i "${GRUBKERNPARAM}" /etc/defualt/grub

# check for public keys in ~/.ssh/
if [[ $(ls ${HOME}/.ssh/*.pub | wc -l) -eq 1 ]]; then
        
        # copy public key over
        sudo cp ${HOME}/.ssh/*.pub /etc/dropbear/root_key
        
        # generate initramfs image
        sudo mkinitcpio -p linux

        # generate grub.conf
        sudo grub-mkconfig -o /boot/grub/grub.cfg


elif [[ $(ls ${HOME}/.ssh/*.pub | wc -l) -eq 0 ]]; then
        echo "It doesn't look like there are any public keys in your ~/.ssh directory, make sure to manually insert your public SSH key as /etc/dropbear/root_key and then regenerate the inital ram disk and the bootloader."
        set -e 

else
        echo "It looks like there are multiple public keys in your ~/.ssh directory, make sure to manually insert the one want to use as /etc/dropbear/root_key and then regenerate the inital ram disk and the bootloader."
        set -e 
fi

