#!/bin/bash
# enable and start all the systemd services after a fresh install

# don't run as sudo
if [ "$EUID" -eq 0 ]
  then echo "Please do not run as root"
  exit
fi

####################
#     SERVICES     #
####################
# system76-power
read -r -p "#### Would you like to enable and start system76-power.service? [y/N] ####" response
if [[ "$response" =~ ^([Yy])+$ ]]; then
        sudo systemctl enable system76-power.service
        sudo systemctl start system76-power.service
fi

# system76-firmware
read -r -p "#### Would you like to enable and start system76-firmware-daemon.service? [y/N] ####" response
if [[ "$response" =~ ^([Yy])+$ ]]; then
        sudo systemctl enable system76-firmware-daemon.service
        sudo systemctl start system76-firmware-daemon.service
fi

# avahi
#read -r -p "#### Would you like to enable and start avahi-daemon.service? [y/N] ####" response
#if [[ "$response" =~ ^([Yy])+$ ]]; then
#        sudo systemctl enable avahi-daemon.service
#        sudo systemctl start avahi-daemon.service
#fi

# tlp
read -r -p "#### Would you like to enable and start tlp.service? [y/N] ####" response
if [[ "$response" =~ ^([Yy])+$ ]]; then
        sudo systemctl enable tlp.service
        sudo systemctl start tlp.service
fi

# cups
read -r -p "#### Would you like to enable and start cups.service? [y/N] ####" response
if [[ "$response" =~ ^([Yy])+$ ]]; then
        sudo systemctl enable org.cups.cupsd.service
        sudo systemctl start org.cups.cupsd.service
fi

# DHCP
read -r -p "#### Would you like to enable and start dhcpcd.service? [y/N] ####" response
if [[ "$response" =~ ^([Yy])+$ ]]; then
        sudo systemctl enable dhcpcd.service
        sudo systemctl start dhcpcd.service
fi

# NetworkManager
read -r -p "#### Would you like to enable and start NetworkManager.service? [y/N] ####" response
if [[ "$response" =~ ^([Yy])+$ ]]; then
        sudo systemctl enable NetworkManager.service
        sudo systemctl start NetworkManager.service
fi

# bluetooth 
read -r -p "#### Would you like to enable and start bluetooth.service? [y/N] ####" response
if [[ "$response" =~ ^([Yy])+$ ]]; then
        sudo systemctl enable bluetooth.service
        sudo systemctl start bluetooth.service
fi

# ly display manager
read -r -p "#### Would you like to enable ly.service? (display manager) [y/N] ####" response
if [[ "$response" =~ ^([Yy])+$ ]]; then
        sudo systemctl enable ly.service
        sudo systemctl disable getty@tty2.service
fi

