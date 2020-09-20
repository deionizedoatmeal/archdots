#!/bin/bash
# this places all the dotfiles and scripts into my system where i need them

# don't run as sudo
if [ "$EUID" -eq 0 ]
  then echo "Please do not run as root"
  exit
fi

# move to the directory the script is in
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd $DIR


read -r -p "THIS WILL OVERWRITE CURRENT CONFIGS, ARE YOU SURE??? [y/N]" response
if [[ "$response" =~ ^([Yy])+$ ]]; then
                # make directories
                mkdir ~/.config/android-messages-desktop/
                mkdir ~/.config/compton/
                mkdir ~/.config/dijo/
                mkdir ~/.config/dunst/
                mkdir ~/.config/gtk-3.0/
                mkdir ~/.config/gtk-4.0/
                mkdir ~/.config/i3/
                mkdir ~/.config/kitty/
                mkdir ~/.config/neofetch/
                mkdir ~/.config/nvim/
                mkdir ~/.config/polybar/
                mkdir ~/.config/ranger/
                mkdir ~/.config/rofi/
                #mkdir ~/.config/spotifyd/
                mkdir ~/.config/spotify-tui/
                mkdir ~/.config/wal/
                mkdir ~/.config/zathura/

        read -r -p "TRITON OR NEPTUNE? [T/N]" RESPONSE
        # TRITON
        if [[ "$RESPONSE" =~ ^([Tt])+$ ]]; then
                cd .. 
                
                #move dotfiles into corresponding config directories
                cp i3/* ${HOME}/.config/i3/.
                ./install-scripts/uncomment.sh T i3/config ${HOME}/.config/i3/config
                ./install-scripts/uncomment.sh T polybar/config ${HOME}/.config/polybar/config
                ./install-scripts/uncomment.sh T polybar/launch.sh ${HOME}/.config/polybar/launch.sh
                cp rofi/config.rasi.tri ${HOME}/.config/rofi/config.rasi
                cp compton/* ${HOME}/.config/compton/.
                ln -sf ~/.cache/wal/zathurarc ~/.config/zathura/zathurarc
                cp ranger/* ${HOME}/.config/ranger/.
                ./install-scripts/uncomment.sh T ranger/rifle.conf ${HOME}/.config/ranger/rifle.conf
                cp -r nvim/* ${HOME}/.config/nvim/.
                ./install-scripts/uncomment.sh T kitty/kitty.conf ${HOME}/.config/kitty/kitty.conf
                ./install-scripts/uncomment.sh T .Xresources ${HOME}/.Xresources
                ln -sf ~/.cache/wal/dunstrc ${HOME}/.config/dunst/dunstrc
                cp -r wal/* ${HOME}/.config/wal/.
                ./install-scripts/uncomment.sh T wal/templates/dunstrc ${HOME}/.config/wal/templates/dunstrc
                cp spotify-tui/* ${HOME}/.config/spotify-tui/.
                #cp spotifyd/* ${HOME}/.config/spotifyd/.
                cp neofetch/* ${HOME}/.config/neofetch/.
                cp .bashrc ${HOME}/.
                cp .gitconfig ${HOME}/.
                cp -r chrome ${HOME}/.mozilla/firefox/*.default-release/.
                cp android-messages-desktop/* ${HOME}/.config/android-messages-desktop/.
                cp gtk/*.ini ${HOME}/.config/gtk-3.0/.
                cp gtk/*.ini ${HOME}/.config/gtk-4.0/.
                cp gtk/.* ${HOME}/.
                sudo cp -r fonts/* /usr/share/fonts/.
                sudo cp spotify-tui/spotify-tui.desktop /usr/share/applications/.
                sudo cp remarkable/remarkable.desktop /usr/share/applications/.
                sudo cp system/fbset-1080.service /etc/systemd/system/.
                cp neofetch/config.conf ${HOME}/.config/neofetch/. 
          
                # reminders 
                echo "|> REMEMBER TO:"
                echo "|> run powertop and tlp"
                echo "|> enter spotifyd password in the ~/.config/spotifyd/config"
                echo "|> set up icons in .desktop files (sudo ./appicon-setup.sh)"
        
        # NEPTUNE        
        elif [[ "$RESPONSE" =~ ^([Nn])+$ ]]; then
                cd ..
                
                #move dotfiles into corresponding config directories
                cp i3/* ${HOME}/.config/i3/.
                ./install-scripts/uncomment.sh N i3/config ${HOME}/.config/i3/config
                ./install-scripts/uncomment.sh N polybar/config ${HOME}/.config/polybar/config
                ./install-scripts/uncomment.sh N polybar/launch.sh ${HOME}/.config/polybar/launch.sh
                cp rofi/config.rasi.nep ${HOME}/.config/rofi/config.rasi
                cp compton/* ${HOME}/.config/compton/.
                ln -sf ~/.cache/wal/zathurarc ~/.config/zathura/zathurarc
                cp ranger/* ${HOME}/.config/ranger/.
                ./install-scripts/uncomment.sh N ranger/rifle.conf ${HOME}/.config/ranger/rifle.conf
                cp -r nvim/* ${HOME}/.config/nvim/.
                ./install-scripts/uncomment.sh N kitty/kitty.conf ${HOME}/.config/kitty/kitty.conf
                ./install-scripts/uncomment.sh N .Xresources ${HOME}/.Xresources
                ln -sf ~/.cache/wal/dunstrc ${HOME}/.config/dunst/dunstrc
                cp -r wal/* ${HOME}/.config/wal/.
                ./install-scripts/uncomment.sh N wal/templates/dunstrc ${HOME}/.config/wal/templates/dunstrc
                cp spotify-tui/* ${HOME}/.config/spotify-tui/.
                #cp spotifyd/* ${HOME}/.config/spotifyd/.
                cp neofetch/* ${HOME}/.config/neofetch/.
                cp .bashrc ${HOME}/.
                cp .gitconfig ${HOME}/.
                cp .xprofile ${HOME}/.
                cp -r chrome ${HOME}/.mozilla/firefox/*.default-release/.
                cp android-messages-desktop/* ${HOME}/.config/android-messages-desktop/.
                cp gtk/*.ini ${HOME}/.config/gtk-3.0/.
                cp gtk/*.ini ${HOME}/.config/gtk-4.0/.
                cp gtk/.* ${HOME}/.
                sudo cp -r fonts/* /usr/share/fonts/.
                sudo cp spotify-tui/spotify-tui.desktop /usr/share/applications/.
                sudo cp remarkable/remarkable.desktop /usr/share/applications/.
                sudo cp system/fbset-1080.service /etc/systemd/system/.
                cp neofetch/config.conf ${HOME}/.config/neofetch/. 
          
                # reminders 
                echo "|> REMEMBER TO:"
                echo "|> enter spotifyd password in the ~/.config/spotifyd/config"
                echo "|> set up icons in .desktop files (sudo ./appicon-setup.sh)"
        fi
fi


