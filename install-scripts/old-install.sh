#!/bin/bash

# .deb downloads
read -r -p "Would you like to download .deb files? [y/N]" response
if [[ "$response" =~ ^([Yy])+$ ]]
then
    wget https://github.com/chrisknepper/android-messages-desktop/releases/download/v3.1.0/android-messages-desktop_3.1.0_amd64.deb
fi


# packages i use
SYS="nvme-cli libxss-dev gnupg2 openssh-client macchanger libssl-dev speedtest-cli transmission-cli transmission-daemon openvpn tty-clock dialog exfat-utils lm-sensors compton libxcb-render0-dev libffi-dev i3lock ffmpeg python-dev python-cffi fonts-fantasque-sans rofi mpg123 system76-driver pass imagemagick feh gnome-tweak-tool htop neovim python-neovim python3-neovim tlp tlp-rdw cmake python-pip python3-pip gcc powertop"
APPS="vlc gnuplot torbrowser-launcher darktable inkscape neofetch steam atom blender gimp spotify-client zathura ranger" 
LAPTOP=""
DESKTOP="busybox busybox-initramfs dropbear-initramfs system76-driver-nvidia openssh-server"

