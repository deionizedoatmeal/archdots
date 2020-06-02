#!/bin/bash
# by ian k. bania
# script to install various pacman, AUR, python, rust packages as well as clone and compiling some software directly from github, really only meant to work with my set up so feel free to canibalize for your own install scripts

###################
#     PACMAN      #
###################
# update and upgrade
sudo pacman -Syy
sudo pacman -Syu

# package lists
SYS="pulseaudio-bluetooth materia-gtk-theme xorg-xrdb cmake clang bc gdisk rust dbus pulseaudio bluez bluez-utils redshift git sudo vi kitty rofi dunst openvpn gnupg imagemagick mpg123 ffmpeg feh python ttf-fantasque-sans-mono python-pip nvme-cli lm_sensors openssh vim bash-completion wget curl zip unzip libev startup-notification xcb-util-cursor xcb-util-keysyms xcb-util-wm xcb-util-xrm libxkbcommon-x11 yajl xcb-proto cairo pango libxcb xcb-util-image jsoncpp libmpdclient libnl wireless_tools libpulse alsa-lib"
# dialog python-setuptools installed on nep??

NONES="pavucontrol libreoffice-fresh cheese nmap htop ranger zathura zathura-pdf-mupdf firefox neovim gnuplot vlc darktable neofetch steam atom gimp zathura ranger pass speedtest-cli net-tools"

TRI="tlp tlp-rdw powertop upower"

NEP="nvidia"

#python3-venv?
#pipx?

#DESKTOP="busybox busybox-initramfs dropbear-initramfs system76-driver-nvidia openssh-server"
#SYS="libxss-dev macchanger libssl-dev speedtest-cli transmission-cli transmission-daemon exfat-utils libxcb-render0-dev libffi-dev python-dev python-cffi"


# pacman install
read -r -p "#### Would you like to install 'essential' software? [y/N] ####" response
if [[ "$response" =~ ^([Yy])+$ ]]; then
        sudo pacman -S --needed $SYS
fi

read -r -p "#### Would you like to install 'optional' software? [y/N] ####" response
if [[ "$response" =~ ^([Yy])+$ ]]; then
        sudo pacman -S --needed $NONES
fi

read -r -p "#### Would you like to install 'triton' software? [y/N] ####" response
if [[ "$response" =~ ^([Yy])+$ ]]; then
        sudo pacman -S --needed $TRI
fi

read -r -p "#### Would you like to install 'neptune' software? [y/N] ####" response
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

# yay package list #########################################################
YAYSYS="ttf-symbola paper-icon-theme aic94xx-firmware wd719x-firmware vim-plug gllock-git compton-tryone-git ly"

#python-pipx autotiling
YAYNEPTUNE=""
YAYTRITON="system76-power system76-driver light-git"
YAYNONES="spotify android-messages-desktop spotifyd-bin-full zoom"
##########################################################################
# yay install

# yay crashes if a single install canidate has issues, 
# which is farirly common considering that yay's dependency system is broken 
# and the AUR is the wild wild west, because of this we have to run yay
# individually on each package
read -r -p "#### Would you like to install 'essential' yay packages? [y/N] ####" response
if [[ "$response" =~ ^([Yy])+$ ]]; then
        ARR=($YAYSYS)
        for i in "${ARR[@]}"; do
                yay -S --needed $i
        done
fi

read -r -p "#### Would you like to install 'triton' yay packages? [y/N] ####" response
if [[ "$response" =~ ^([Yy])+$ ]]; then
        ARR=($YAYTRITON)
        for i in "${ARR[@]}"; do
                yay -S --needed $i
        done
fi

read -r -p "#### Would you like to install 'optional' yay packages? [y/N] ####" response
if [[ "$response" =~ ^([Yy])+$ ]]; then
        ARR=($YAYNONES)
        for i in "${ARR[@]}"; do
                yay -S --needed $i
        done
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

# tlp
read -r -p "#### Would you like to enable and start tlp.service? [y/N] ####" response
if [[ "$response" =~ ^([Yy])+$ ]]; then
        sudo systemctl enable tlp.service
        sudo systemctl start tlp.service
fi

# DHCP
read -r -p "#### Would you like to enable and start dhcpcd.service? [y/N] ####" response
if [[ "$response" =~ ^([Yy])+$ ]]; then
        sudo systemctl enable dhcpcd.service
        sudo systemctl start dhcpcd.service
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

####################
#    GIT REPOS     #
####################
# install light utility
#read -r -p "Would you like to install light (a backlight control utility)? [y/N]" response
#if [[ "$response" =~ ^([Yy])+$ ]]; then
#        git clone https://github.com/haikarainen/light.git
#        cd light
#        ./autogen.sh
#        ./configure
#        make
#        sudo make install              
#        cd ..
#        sudo rm -r light
#        echo 'light.git installed'
#fi

# gnuplot pywal 
read -r -p "Would you like to install Gnuplot-Pywal? [y/N]" response
if [[ "$response" =~ ^([Yy])+$ ]]; then
        git clone https://github.com/GideonWolfe/Gnuplot-Pywal.git
        cd Gnuplot-Pywal
        sudo ./install.sh
        cd ..
        sudo rm -r Gnuplot-Pywal
        echo 'Gnuplot-Pywal.git installed'
fi


# t todo 
read -r -p "Would you like to install t.py (a bare bones CLI todo list)? [y/N]" response
if [[ "$response" =~ ^([Yy])+$ ]]; then
        mkdir ${HOME}/Tasks
        git clone https://github.com/sjl/t.git $HOME/Tasks/.
        echo 't.git installed'
fi

# now using the AUR
# install spotifyd
#read -r -p "Would you like to install Spotifyd v0.2.24? [y/N]" response
#if [[ "$response" =~ ^([Yy])+$ ]]; then
#        wget https://github.com/Spotifyd/spotifyd/releases/download/v0.2.24/spotifyd-linux-full.tar.gz
#        tar -xf spotifyd-linux-full.tar.gz
#        sudo mv spotifyd /bin/spotifyd
#        rm spotifyd-linux-full.tar.gz
#fi
# install nvim plugin manager
#read -r -p "Would you like to install vim-plug? [y/N]" response
#if [[ "$response" =~ ^([Yy])+$ ]]; then
#        curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.git
#        hubusercontent.com/junegunn/vim-plug/master/plug.vim
#fi


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
    sudo pipx install jrnl
    sudo pip install mdv
<<<<<<< HEAD

=======
   
>>>>>>> 8287b71de018018620f37ec56cff49d76c377216
    #sudo pip install i3-py
    #sudo pip3 install wpgtk
    echo 'python packages installed'
fi

####################
#      RUST        #
####################
# install rust
#read -r -p "Would you like to install rust? [y/N]" response 
#if [[ "$response" =~ ^([Yy])+$ ]]; then
#        curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
#fi

# install rust packages    
read -r -p "Would you like to install rust packages? [y/N]" response 
if [[ "$response" =~ ^([Yy])+$ ]]; then
        cargo install spotify-tui
        cargo install bottom
        cargo install -f --git https://github.com/cjbassi/ytop ytop
fi


####################
#    i3 COMPILE    #
####################
#read -r -p "#### Would you like to compile and install i3? [y/N] ####" response
#if [[ "$response" =~ ^([Yy])+$ ]]; then
#        ./i3gaps-install
#fi



# all done!
