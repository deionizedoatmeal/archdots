#!/bin/bash
# comment out needed lines for apt based or pacman based systems 
# this compiles a fork of i3-gaps with rounded window corners (https://github.com/resloved/i3.git)

# pacman
sudo pacman -Syy && sudo pacman -Syu

# apt
#sudo apt update && sudo apt upgrade

# apt dependencies on ubuntu
#sudo apt install -y git wget curl zip unzip libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf xutils-dev libtool libxcb-xrm0 libxcb-xrm-dev automake libxcb-shape0-dev

# pacman dependencies on arch 
sudo pacman -S --needed git wget curl zip unzip libev startup-notification xcb-util-cursor xcb-util-keysyms xcb-util-wm xcb-util-xrm libxkbcommon-x11 yajl cairo pango

cd /tmp

# clone the repository
git clone https://github.com/resloved/i3.git
cd i3

# compile & install
autoreconf --force --install
rm -rf build/
mkdir -p build && cd build/

# disabling sanitizers is important for release versions
../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
make
sudo make install

