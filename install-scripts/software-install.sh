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
SYS="bc gdisk rust dbus powertop pulseaudio bluez bluez-utils redshift upower git sudo vi kitty rofi dunst openvpn gnupg imagemagick mpg123 ffmpeg feh ttf-fantasque-sans-mono tlp tlp-rdw python-pip nvme-cli lm_sensors openssh vim bash-completion"
NONES="pavucontrol nmap htop ranger zathura zathura-pdf-mupdf firefox neovim gnuplot vlc darktable neofetch steam atom gimp zathura ranger pass powertop htop speedtest-cli net-tools"
TRI=""
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
YAYSYS="aic94xx-firmware wd719x-firmware i3-gaps-rounded-git vim-plug gllock-git compton-tryone-git polybar ly"
#python-pipx autotiling
YAYNEPTUNE=""
YAYTRITON="system76-power system76-driver light-git"
YAYNONES="spotify paper-icon-theme-git android-messages-desktop spotifyd-bin-full zoom"
##########################################################################
# yay install
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
        sudo systemctl enabled system76-power.service
        sudo systemctl start system76-power.service
fi


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
MKDIR $HOME/Tasks
if [[ "$response" =~ ^([Yy])+$ ]]; then
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
    #sudo pip3 install protonvpn-cli
    sudo pip3 install inkscape-figures
    sudo pip3 install spotdl
    sudo pip3 install cl-chess
    sudo pipx install jrnl
    sudo pip install mdv
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
