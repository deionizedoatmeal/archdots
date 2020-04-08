#!/bin/bash
# by ian k. bania
# script to install various pacman, AUR, python, rust packages as well as clone and compiling some software directly from github

###################
#     PACMAN      #
###################
# update and upgrade
sudo pacman -Syy
sudo pacman -Syu

# package lists
SYS="bc gdisk dbus powertop pulseaudio bluez bluez-utils reshift upower git sudo vi kitty rofi picom dunst openvpn i3lock gnupg imagemagick mpg123 ffmpeg feh ttf-fantasque-sans-mono tlp tlp-rdw python-pip nvme-cli lm_sensors openssh"
APPS="htop ranger zathura firefox neovim gnuplot vlc darktable neofetch steam atom gimp zathura ranger pass powertop htop speedtest-cli"
TRI=""
NEP=""

#DESKTOP="busybox busybox-initramfs dropbear-initramfs system76-driver-nvidia openssh-server"
#SYS="libxss-dev macchanger libssl-dev speedtest-cli transmission-cli transmission-daemon exfat-utils libxcb-render0-dev libffi-dev python-dev python-cffi"


# pacman install
read -r -p "#### Would you like to install essential software? [y/N] ####" response
if [[ "$response" =~ ^([Yy])+$ ]]; then
        sudo pacman -S --needed $SYS
fi

read -r -p "#### Would you like to install optional software? [y/N] ####" response
if [[ "$response" =~ ^([Yy])+$ ]]; then
        sudo pacman -S --needed $APPS
fi

read -r -p "#### Would you like to install triton software? [y/N] ####" response
if [[ "$response" =~ ^([Yy])+$ ]]; then
        sudo pacman -S --needed $TRI
fi

read -r -p "#### Would you like to install neptune software? [y/N] ####" response
if [[ "$response" =~ ^([Yy])+$ ]]; then
        sudo pacman -S --needed $NEP
fi


###################
#       YAY       #
###################
# clone and install yay
read -r -p "#### Would you like to install yay (an AUR package manager)? [y/N] ####" response
if [[ "$response" =~ ^([Yy])+$ ]]; then
        git clone https://aur.archlinux.org/yay.git
        cd yay
        makepkg -si
        cd .. && sudo rm -r yay
fi

# yay package list
YAYSYS="android-messages-desktop polybar spotify system76-power system76-driver ly"

# yay install
read -r -p "#### Would you like to install yay packages? [y/N] ####" response
if [[ "$response" =~ ^([Yy])+$ ]]; then
        yay -S --needed $YAYSYS
fi

# system76-power
read -r -p "#### Would you like to enable and start system76-power.service? [y/N] ####" response
if [[ "$response" =~ ^([Yy])+$ ]]; then
        sudo systemctl enabled system76-power.service
        sudo systemctl start system76-power.service
fi


####################
#    GIT REPOS     #
####################
# install light utility
read -r -p "Would you like to install light (a backlight utility)? [y/N]" response
if [[ "$response" =~ ^([Yy])+$ ]]; then
        git clone https://github.com/haikarainen/light.git
        cd light
        ./autogen.sh
        ./configure
        make
        sudo make install              
        cd ..
        sudo rm -r light
        echo 'backlight utility installed'
fi

# install spotifyd
read -r -p "Would you like to install Spotifyd v0.2.24? [y/N]" response
if [[ "$response" =~ ^([Yy])+$ ]]; then
        wget https://github.com/Spotifyd/spotifyd/releases/download/v0.2.24/spotifyd-linux-full.tar.gz
        tar -xf spotifyd-linux-full.tar.gz
        sudo mv spotifyd /bin/spotifyd
        rm spotifyd-linux-full.tar.gz
fi

# install nvim plugin manager
read -r -p "Would you like to install vim-plug? [y/N]" response
if [[ "$response" =~ ^([Yy])+$ ]]; then
        curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.git
        hubusercontent.com/junegunn/vim-plug/master/plug.vim
fi



####################
#      PYTHON      #
####################
# install python packages
read -r -p "Would you like to install python packages? [y/N]" response
if [[ "$response" =~ ^([Yy])+$ ]]; then
    sudo pip3 install pywal
    sudo pip install flashfocus
    sudo pip3 install protonvpn-cli
    sudo pip3 install inkscape-figures
    sudo pip3 install spotdl
    sudo pip3 install cl-chess
    sudo pip3 install wpgtk
    echo 'python packages installed'
fi

####################
#      RUST        #
####################
# install rust
read -r -p "Would you like to install rust? [y/N]" response 
if [[ "$response" =~ ^([Yy])+$ ]]; then
        curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

# install rust packages    
read -r -p "Would you like to install rust packages? [y/N]" response 
if [[ "$response" =~ ^([Yy])+$ ]]; then
        cargo install spotify-tui
        cargo install -f --git https://github.com/cjbassi/ytop ytop
fi



####################
#    i3 COMPILE    #
####################
read -r -p "#### Would you like to compile and install i3? [y/N] ####" response
if [[ "$response" =~ ^([Yy])+$ ]]; then
        ./i3gaps-install
fi






