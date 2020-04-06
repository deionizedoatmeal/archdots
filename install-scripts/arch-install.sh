#!/bin/bash
# script to initalize an arch linux system from a live .iso
# sets up a system with LVM on LUKS installer
# mostly thrown together from various guides and the arch wiki

# update system clock
timedatectl set-ntp true

# partition disk
lsblk
read -r -p "What disk would you like to install on? (e.g. nvme0n1 or sda)" disk
gdisk /dev/${disk}

