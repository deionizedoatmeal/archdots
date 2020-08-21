#!/bin/bash
# adds the keyfile that was randkmly generated at install to my luks partions for the non root drives
# this allows these drives to be automatically dexrypted at startup once the root partion is unlocked 

# don't run as sudo
if [ "$EUID" -eq 0 ]
  then echo "Please do not run as root"
  exit
fi


# open and add key file
sudo cryptsetup open /dev/sde1 external
sudo cryptsetup luksAddKey /dev/sde1 /root/secrets/crypto_keyfile.bin

# open and add key file
sudo cryptsetup open /dev/sda ssd
sudo cryptsetup luksAddKey /dev/sda /root/secrets/crypto_keyfile.bin

# open and add key file
sudo cryptsetup open /dev/mapper/storage-hdd hdd
sudo cryptsetup luksAddKey /dev/mapper/storage-hdd /root/secrets/crypto_keyfile.bin

# dump ket slots
sudo cryptsetup luksDump /dev/sde1
sudo cryptsetup luksDump /dev/sda
sudo cryptsetup luksDump /dev/mapper/storage-hdd

