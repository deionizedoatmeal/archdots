#!/bin/bash
# script to initalize an arch linux system from a live .iso
# sets up a system with LVM on LUKS encryption
# mostly thrown together from various guides and the arch wiki
# i honestly don't remcomend using this yet it barely works for me

# to use, boot an arch live iso, connect to the internet, then run these commands:
# --> pacman -Syy
# --> pacman -S git
# --> git clone https:/github.com/deionizedoatmeal/archdots.git
# --> ./archdots/install-scripts/arch-install-1.sh
# or just open this in your phone's browser and do it by hand i guess

# update system clock
timedatectl set-ntp true

##########################
##### PARTITION DISK #####
##########################
# ask user what disk to install on
lsblk

# make sure the user types the disk name in corrently
while true; do
        read -r -p "What disk would you like to install on? (e.g. nvme0n1 or sda) *NOTE* This will wipe the entire disk! No partition will be safe! " DISK

        # if using an nvme, make sure to at the p for the partion numbers in commands

        if [[ $(echo ${DISK} | cut -c 1-6) == "nvme0n" ]]; then 
                DISKP=$(echo "${DISK}p")
                break

        elif [[ $(echo ${DISK} | cut -c 1-2) == "sd" ]]; then 
                DISKP=${DISK}
                break

        else
                echo "Not a valid disk type, try again."
                continue

        fi
done


# launch gdisk
sed -e 's/\s*\([\+0-9a-zA-Z]*\).*/\1/' << EOF | gdisk /dev/${DISK}
        o             # clear table
        Y             # confirm
        n             # new patition
                      # default number (1)
                      # default start sector
        +250M         # 250 MiB
        EF02          # BIOS boot partition
        n             # new patition
                      # default number (2)
                      # default start sector
        +550M         # 550 MiB
        EF00          # EFI system
        n             # new partition 
                      # default number (3)
                      # rest of disk
                      # rest of disk
        8309          # linux luks filesystem
        w             # write and exit
        Y             # confirm
EOF

# user confirmation
echo "Disk should be partioned as such:"
echo "${DISK}"
echo "--> ${DISKP}1 ---- 250M ----------- BIOS"
echo "--> ${DISKP}2 ---- 550M ----------- EFI"
echo "--> ${DISKP}3 ---- rest of disk --- Linux LUKS"
echo "lsblk:"

lsblk
read -r -p "Does this look correct? [Y/n]" response
if [[ "$response" =~ ^([Nn])+$ ]]; then
        echo "OK, fix it yourself"
        set -e
fi

# create encrypted LUKS1 container on LUKS partion (GRUB still doesn't like LUKS2 smh)
echo "You will now be asked to set and confirm your encryption passphrase, DO NOT forget this. If you make a typo you will have the option of trying again."
while true; do
        cryptsetup luksFormat --type luks1 --use-random -S 1 -s 512 -h sha512 -i 5000 /dev/${DISKP}3

        #retry if ya goofed
        read -r -p "Do you need to try again? [y/N]" response
        if [[ "$response" =~ ^([Yy])+$ ]]; then
                continue
        else
                break
        fi
done


# open the LUKS container (shows up at /dev/mapper/cryptlvm)
cryptsetup open /dev/${DISKP}3 cryptlvm

# create physical volume on opened LUKS container
pvcreate /dev/mapper/cryptlvm

# create volume group and add volume
vgcreate vg /dev/mapper/cryptlvm

# ask for user input
read -r -p "How much swap would you like in the system? (Answer in integer GB, ian likes 8)" SWAP

read -r -p "How much space for root would you like in the system? (Answer in integer GB, ian likes 50 or 60)" ROOT

# set up swap, root and home
lvcreate -L ${SWAP}G vg -n swap
lvcreate -L ${ROOT}G vg -n root
lvcreate -l 100%FREE vg -n home

# format filesystems
mkfs.ext4 /dev/vg/root
mkfs.ext4 /dev/vg/home
mkswap /dev/vg/swap

# mount filesystems
mount /dev/vg/root /mnt
mkdir /mnt/home
mount /dev/vg/home /mnt/home
swapon /dev/vg/swap

# format boot partition
mkfs.ext2 /dev/${DISKP}1

# format EFI partion
mkfs.fat -F32 /dev/${DISKP}2

# mount boot partion
mkdir /mnt/boot
mount /dev/${DISKP}1 /mnt/boot

mkdir /mnt/boot/efi
mount /dev/${DISKP}2 /mnt/boot/efi

# install base system
pacstrap /mnt base base-devel linux linux-firmware mkinitcpio lvm2 vi dhcpcd networkmanager wpa_supplicant dialog git neovim

# generate fstab file
genfstab -U /mnt >> /mnt/etc/fstab

# clone this repo on the new system
git clone https://github.com/deionizedoatmeal/archdots.git /mnt/archdots

echo "Live image set up complete, now going to chroot into the new system. Once there execute the ./archdots/install-scripts/arch-install-2.sh script to finish the install process."

touch /mnt/archdots/system/diskp
touch /mnt/archdots/system/disk
echo ${DISKP} >> /mnt/archdots/system/diskp
echo ${DISK} >> /mnt/archdots/system/disk

# chroot to the new system
arch-chroot /mnt

