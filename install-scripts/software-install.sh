#!/bin/bash
# by ian k. bania

# don't run as sudo
if [ "$EUID" -eq 0 ]
  then echo "Please do not run as root"
  exit
fi

###################
#     PACMAN      #
###################
# update and upgrade
sudo pacman -Syyu

# package lists
SYS="lsd fd python-pywal python-pillow python python-pip ttf-jetbrains-mono calcurse ntp openconnect rclone cpupower dmidecode inetutils xdotool nfsidmap exfat-utils dosfstools ntfsprogs rsync rdiff-backup materia-gtk-theme gvim ctags cmake clang bc gdisk rust dbus pulseaudio paprefs pavucontrol pulseaudio-bluetooth blueman bluez bluez-utils pass redshift git sudo vi kitty rofi dunst openvpn gnupg imagemagick sox mpg123 ffmpeg feh ttf-fantasque-sans-mono nvme-cli lm_sensors openssh bash-completion wget curl zip unzip libev startup-notification xcb-util-cursor xcb-util-keysyms xcb-util-wm xcb-util-xrm libxkbcommon-x11 yajl xcb-proto cairo pango libxcb xcb-util-image jsoncpp libmpdclient libnl wireless_tools libpulse alsa-lib htop pacman-contrib hyperfine"
# displaycal
# dialog python-setuptools installed on nep??

NONES="python-pandas python-mpmath python-scipy python-numpy python-matplotlib jupyterlab github-cli qgis scrot arandr texlive-most digikam cups cups-pdf inkscape hddtemp libreoffice-fresh cheese spotifyd nmap perl-image-exiftool ranger zathura zathura-pdf-mupdf firefox gnuplot vlc darktable neofetch steam atom gimp zathura speedtest-cli go highlight"

TRI="xf86-video-intel vulkan-intel powertop upower"
#tlp tlp-rdw removed in aug 

NEP="blender apcupsd fbset xf86-video-amdgpu vulkan-radeon lib32-vulkan-radeon remmina kdenlive libvncserver virtualbox virtualbox-host-modules-arch"

#python3-venv?
#pipx?

#OLDDESKTOP="busybox busybox-initramfs dropbear-initramfs system76-driver-nvidia openssh-server"
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
YAYSYS="bottom flashfocus-git fet.sh-git brother-mfc-9560cdw ttf-symbola paper-icon-theme vim-plug i3lock-color-git steam-fonts comptone-tryone-git icdiff git-delta-bin duf"
#python-pipx teamviewer autotiling picom-ibhagwan-git
YAYNEPTUNE="siril-git google-earth-pro virtualbox-ext-oracle remmina-plugin-rdesktop howdy opencv"
YAYTRITON="system76-power system76-firmware-daemon system76-driver light-git"
YAYNONES="jupyterthemes python-pytube3 python-spotdl remarkable-client rmapi slack-desktop slack-term spotify-tui-git spotify android-messages-desktop zoom texlive-full rmview-git"
YAYASTR="topcat ds9 astroimagej imagej fiji-bin"
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

read -r -p "#### Would you like to install 'neptune' yay packages? [y/N] ####" response
if [[ "$response" =~ ^([Yy])+$ ]]; then
        ARR=($YAYNEPTUNE)
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

read -r -p "#### Would you like to install 'astro' yay packages? [y/N] ####" response
if [[ "$response" =~ ^([Yy])+$ ]]; then
        ARR=($YAYASTR)
        for i in "${ARR[@]}"; do
                yay -S --needed $i
        done
fi

read -r -p "#### Would you like to install ly? [y/N] ####" response
if [[ "$response" =~ ^([Yy])+$ ]]; then
        yay -S --needed ly
fi

read -r -p "#### Would you like to install sddm? [y/N] ####" response
if [[ "$response" =~ ^([Yy])+$ ]]; then
        yay -S --needed ly
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

# mesa reader
read -r -p "Would you like to install py_mesa_reader? [y/N]" response
if [[ "$response" =~ ^([Yy])+$ ]]; then
    git clone git@github.com:wmwolf/py_mesa_reader.git
    cd py_mesa_reader
    sudo pip install .
    cd ..
    sudo rm -r py_mesa_reader
fi

# kite
read -r -p "Would you like to install kite? [y/N]" response
if [[ "$response" =~ ^([Yy])+$ ]]; then
        bash -c "$(wget -q -O - https://linux.kite.com/dls/linux/current)"
fi


####################
#      PYTHON      #
####################
# install python packages
echo "Python packages: inscape-figures, spotdl, grip."
read -r -p "Would you like to install python packages? [y/N]" response
if [[ "$response" =~ ^([Yy])+$ ]]; then
    # sudo pip install flashfocus
    # sudo pipx install jrnl
    # sudo pip install protonvpn-cli
    # sudo pip install mdv
    sudo pip install inkscape-figures
    sudo pip install spotdl
    sudo pip install grip
    sudo pip install fortran-language-server
    # sudo pip install i3-py
    # sudo pip install wpgtk
    echo 'python packages installed'
fi

# install rust packages    
# read -r -p "Would you like to install rust packages? [y/N]" response 
# if [[ "$response" =~ ^([Yy])+$ ]]; then
        # cargo install spotify-tui # using AUR now
        # cargo install bottom
        # cargo install dijo # not using rn
        # cargo install -f --git https://github.com/cjbassi/ytop ytop # replaced with bottom
# fi

