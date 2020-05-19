#!/bin/bash
# arch install part 2 electric buggalo

#read in variables
DISK=$(cat /archdots/system/disk)
DISKP=$(cat /archdots/system/diskp)

echo "Firmware installed."
# user confirmation of lvm and luks setuo
echo "Disk should be partioned and volumized as such:"
echo "#########################################################"
echo "${DISK}"
echo "--> ${DISKP}1 -------- 250M ------------ part ----- /boot"
echo "--> ${DISKP}2 -------- 550M ------------ part ----- /boot/efi"
echo "--> ${DISKP}3 -------- rest of disk ---- part ----- "
echo "   --> cryptlvm ------ rest of disk ---- crypt ---- "
echo "      --> vg-swap ---- 8G -------------- lvm ------ [SWAP]"
echo "      --> vg-root ---- 20G or 30G------- lvm ------ /"
echo "      --> vg-home ---- rest of disk ---- lvm ------ /home"
echo "#########################################################"
echo "lsblk:"

lsblk
read -r -p "Does this look correct? [Y/n]" response
if [[ "$response" =~ ^([Nn])+$ ]]; then
        echo "OK, fix it yourself"
        set -e
fi

echo "Pick a timezone, some options are:"
echo " --> America/Anchorage"
echo " --> America/Los_Angeles"
echo " --> America/Denver"  
echo " --> America/Chicago" 
echo " --> America/New_York"
echo " --> America/Santiago"
echo " --> America/Sao_Paulo"
echo " --> Europe/London"
echo " --> Europe/Berlin" 
echo " --> Europe/Istanbul" 
echo " --> Europe/Moscow"
echo " --> Asia/Honk_Kong"
echo " --> Asia/Tokyo"
echo " --> Australia/Canberra"
echo " --> Pacific/Honolulu"

while true; do
        # set timezone
        read -r -p "Timezone: " TIMEZN

        if [[ -f /usr/share/zoneinfo/${TIMEZN} ]]; then
                ln -sf /usr/share/zoneinfo/${TIMEZN} /etc/localtime
                break
        else
                echo "Sorry the unix timelords have decided that timezone does not exist, try again."
                continue
        fi
done

# clock stuff
hwclock --systohc

# set hostname
read -r -p "Chose a hostname: " HNAME
touch /etc/hostname
echo ${HNAME} >> /etc/hostname

# set up /etc/hosts
echo "127.0.1.1 	${HNAME}.localdomain	${HNAME}" >> /archdots/system/hosts_incomplete
cp /archdots/system/hosts_incomplete /etc/hosts


# get the UUID for LUKS partition
LUKSUUID=$(blkid | grep "${DISKP}3" | grep -o "UUID=.*" | cut -d\" -f2)

# remove existing line in the file
sed -i '/GRUB_CMDLINE_LINUX=/d' ./etc/default/grub

# and insert that into tempelate for /etc/default/grub
LINEINSERT=$(echo "10iGRUB_CMDLINE_LINUX="cryptdevice=UUID=${LUKSUUID}:cryptlvm root=/dev/vg/root cryptkey=rootfs:/root/secrets/crypto_keyfile.bin"")

sed -i "${LINEINSERT}" /archdots/system/grub

# copy /etc/default/grub and font over
cp -p /archdots/system/grub /etc/default/grub
cp -p /archdots/system/JetBrainsMono-Bold.pf2 /boot/grub/fonts/.

# copy sudoers mkinitcpio.conf and pacman.conf
cp -p /archdots/system/sudoers /etc/sudoers
cp -p /archdots/system/mkinitcpio.conf /etc/mkinitcpio.conf
cp -p /archdots/system/pacman.conf /etc/pacman.conf
pacman -Syy

# install grub
pacman -S efibootmgr grub
grub-install --target=x86_64-efi --efi-directory=/boot/efi

# intel microcode updates
pacman -S intel-ucode

# create a keyfile to embed in initramfs
mkdir /root/secrets && chmod 700 /root/secrets
head -c 64 /dev/urandom > /root/secrets/crypto_keyfile.bin
chmod 600 /root/secrets/crypto_keyfile.bin

# unlock key slot for initramds
while true; do
        echo "Now enter your disk encryption passphrase! If you mess up you can try again."
        cryptsetup -v luksAddKey -i 1 /dev/${DISKP}3 /root/secrets/crypto_keyfile.bin

        #retry if ya goofed
        read -r -p "Do you need to try again? [y/N]" response
        if [[ "$response" =~ ^([Yy])+$ ]]; then
                continue
        else
                break
        fi
done

# create initramfs image
mkinitcpio -p linux

# set root password
while true; do
        echo "Set your root password!"
        passwd

        #retry if ya goofed
        read -r -p "Do you need to try again? [y/N]" response
        if [[ "$response" =~ ^([Yy])+$ ]]; then
                continue
        else
                break
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
        read -r -p "Do you need to try again? [y/N]" response
        if [[ "$response" =~ ^([Yy])+$ ]]; then
                continue
        else
                break
        fi
done

# install graphics drivers
read -r -p "Do you want to install nvidia drivers? [Y/n]" response
if [[ "$response" =~ ^([Nn])+$ ]]; then
        echo "cool"
else
        pacman -S nvidia
fi

#enable multilib
#LINE="Include = /etc/pacman.d/mirrorlist"
#sed -i "/^#$LINE/ c$LINE" /etc/pacman.conf

# remove this repo
rm -r /archdots

echo "Now check everything, exit and reboot"
