#!/bin/bash
# arch install part 2 electric buggalo

# aic94xx-firmware
cd aic94xx-firmware
makepkg -sri
cd ..
rm -r aic94xx-firmware

# wd719x-firmware
cd wd719x-firmware
makepkg -sri
cd ..
rm -r wd719x-firmware

echo "Firmware installed."

# user confirmation of lvm and luks setuo
echo "Disk should be partioned and volumized as such:"
echo "#########################################################"
echo "${DISK}"
echo "--> ${DISKP}1 -------- 550M ------------ part ----- /efi"
echo "--> ${DISKP}2 -------- rest of disk ---- part ----- "
echo "   --> cryptlvm ------ rest of disk ---- crypt ---- "
echo "      --> vg-swap ---- 8G -------------- lvm ------ [SWAP]"
echo "      --> vg-root ---- 20G ------------- lvm ------ /"
echo "      --> vg-home ---- rest of disk ---- lvm ------ /home"
echo "#########################################################"
echo "lsblk:"

lsblk
read -r -p "Does this look correct? [Y/n]" response
if [[ "$response" =~ ^([Nn])+$ ]]; then
        echo "OK, fix it yourself"
        set -e
fi


while true; do
        # set timezone
        read -r -p "Pick a timezone, some options are: America/Anchorage, America/Los_Angeles, America/Denver, America/Chicago, America/New_York, America/Santiago, America/Sao_Paulo, Europe/London, Europe/Berlin, Europe/Istanbul, Europe/Moscow, Asia/Honk_Kong, Asia/Tokyo, Australia/Canberra, Pacific/Honolulu" TIMEZN

        if [[ -f /usr/share/zoneinfo/${TIMEZN} ]]; then
                ln -sf /usr/share/zoneinfo/${TIMEZN} /etc/localtime
                break
        else
                echo "Sorry the timelords have decided that timezone does not exist, try again."
                continue
        fi
done

# clock stuff
hwclock --systohc

# set hostname
read -r -p "Chose a hostname: " HNAME
touch /etc/hostname && cat /etc/hostname ${HNAME}

# set up /etc/hosts
echo "127.0.1.1 	${HNAME}.localdomain	${HNAME}" >> /dots/system/hosts_incomplete
cp /dots/system/hosts_incomplete /etc/hosts


# get the UUID for LUKS partition
LUKSUUID=$(blkid | grep "${DISKP}2" | grep -o "UUID=.*" | cut -d\" -f2)

# insert that into tempelate for /etc/default/grub
LINEINSERT$="GRUB_CMDLINE_LINUX="cryptdevice=UUID=${LUKSUUID}:cryptlvm root=/dev/vg/root cryptkey=rootfs:/root/secrets/crypto_keyfile.bin""

awk '/INSERT_UUID_OF_LUKS_PARTITION_HERE/ { print; print $LINEINSERT; next }1' /dots/system/grub

# copy /etc/sudoers /etc/mkinitcpio.conf and /etc/default/grub over
cp -p /dots/system/sudoers /etc/sudoers
cp -p /dots/system/mkinitcpio.conf /etc/mkinitcpio.conf
cp -p /dots/system/grub /etc/default/grub


# install grub
pacman -S efibootmgr grub
grub-install --target=x86_64-efi --efi-directory=/efi

# intel microcode updates
pacman -S intel-ucode

# create a keyfile to embed in initramfs
mkdir /root/secrets && chmod 700 /root/secrets
head -c 64 /dev/urandom > /root/secrets/crypto_keyfile.bin && chmod 600 /root/secrets/crypto_keyfile.bin
cryptsetup -v luksAddKey -i 1 /dev/${DISKP}2 /root/secrets/crypto_keyfile.bin

# create initramfs image
mkinitcpio -p linux

# set root password
while true; do
        echo "Set your root password!"
        passwd

        #retry if ya goofed
        read -r -p "Do you need to try again? [Y/n]" response
        if [[ "$response" =~ ^([Nn])+$ ]]; then
                break
        else
                continue
        fi
done

# generate grub.conf
grub-mkconfig -o /boot/grub/grub.cfg

# set /boot permissions
chmod 700 /boot

# create user
read -r -p "Choose a username! " UNAME
useradd -m -g users -G wheel -s /bin/bash $UNAME

while true; do
        echo "Now choose a password!"
        passwd $UNAME
        
        #retry if ya goofed
        read -r -p "Do you need to try again? [Y/n]" response
        if [[ "$response" =~ ^([Nn])+$ ]]; then
                break
        else
                continue
        fi
done

# reclone dots for ease of accses after reboot 
cd /home/${UNAME}
mkdir Repos && cd Repos
git clone https://github.com/deionizedoatmeal/dots.git

# remove this repo
rm -r /dots

echo "Now check everything, exit and reboot"
