#!/bin/bash
# this places all the dotfiles and scripts into my system where i need them

read -r -p "THIS WILL OVERWRITE CURRENT CONFIGS, ARE YOU SURE??? [y/N]" response
if [[ "$response" =~ ^([Yy])+$ ]]; then
                # make directories
                mkdir ~/.config/i3/
                mkdir ~/.config/polybar/
                mkdir ~/.config/rofi/
                mkdir ~/.config/compton/
                mkdir ~/.config/zathura/
                mkdir ~/.config/nvim/
                mkdir ~/.config/ranger/
                mkdir ~/.config/dunst/
                mkdir ~/.config/wal/templates/
                mkdir ~/.config/wal/
                mkdir ~/.config/spotify-tui/
                mkdir ~/.config/spotifyd/
                mkdir ~/.config/kitty/
                mkdir ~/.config/'Android Messages'/
                mkdir ~/.config/gtk-3.0/
                mkdir ~/.config/gtk-4.0/

        read -r -p "TRITON OR NEPTUNE? [T/N]" RESPONSE
        # TRITON
        if [[ "$RESPONSE" =~ ^([Tt])+$ ]]; then
                cd "${0%/*}"
                cd .. 
                
                #move dotfiles into corresponding config directories
                cp i3/* ${HOME}/.config/i3/.
                ./install-scripts/uncomment.sh T i3/config ${HOME}/.config/i3/config
                ./install-scripts/uncomment.sh T polybar/config ${HOME}/.config/polybar/config
                ./install-scripts/uncomment.sh T polybar/launch.sh ${HOME}/.config/polybar/launch.sh
                cp rofi/config.rasi.tri ${HOME}/.config/rofi/config.rasi
                cp compton/* ${HOME}/.config/compton/.
                ln -sf ~/.cache/wal/zathurarc ~/.config/zathura/zathurarc
                cp -r ranger/* ${HOME}/.config/ranger/.
                ./install-scripts/uncomment.sh T ranger/rifle.conf ${HOME}/.config/ranger/rifle.conf
                cp -r nvim/* ${HOME}/.config/nvim/.
                ./install-scripts/uncomment.sh T kitty/kitty.conf ${HOME}/.config/kitty/kitty.conf
                ./install-scripts/uncomment.sh T .Xresources ${HOME}/.Xresources
                ln -sf ~/.cache/wal/dunstrc ${HOME}/.config/dunst/dunstrc
                cp wal/templates/* ${HOME}/.config/wal/templates/.
                ./install-scripts/uncomment.sh T wal/templates/dunstrc ${HOME}/.config/wal/templates/dunstrc
                cp spotify-tui/* ${HOME}/.config/spotify-tui/.
                cp spotifyd/* ${HOME}/.config/spotifyd/.
                cp neofetch/* ${HOME}/.config/neofetch/.
                cp .bashrc ${HOME}/.
                cp .gitconfig ${HOME}/.
                cp -r chrome ${HOME}/.mozilla/firefox/*.default-release/.
                cp android_messages/* ${HOME}/.config/'Android Messages'/.
                cp zoomus.conf ${HOME}/.config/.
                cp gtk/*.ini ${HOME}/.config/gtk-3.0/.
                cp gtk/*.ini ${HOME}/.config/gtk-4.0/.
                cp gtk/.* ${HOME}/.
                sudo cp -r fonts/* /usr/share/fonts/.
                sudo cp spotify-tui/spotify-tui.desktop /usr/share/applications/.
          
                # reminders 
                echo "|> REMEMBER TO:"
                echo "|> set layers.acceleration.force-enabled --> true TO PREVENT TARING IN FIREFOX"
                echo "|> change spotifyd password in the config"
                echo "|> import gpg and ssh keys"
                echo "|> run powertop and tlp"
                echo "|> set up pass, and tasks*"
                echo "|> pair all bluetooth devices"
                echo "|> install Wolfram Wathematica"
                echo "|> set up spotifyd with your password and email"
        
        # NEPTUNE        
        elif [[ "$RESPONSE" =~ ^([Nn])+$ ]]; then
                cd "${0%/*}"
                cd ..
                
                #move dotfiles into corresponding config directories
                cp i3/* ${HOME}/.config/i3/.
                ./install-scripts/uncomment.sh N i3/config ${HOME}/.config/i3/config
                ./install-scripts/uncomment.sh N polybar/config ${HOME}/.config/polybar/config
                ./install-scripts/uncomment.sh N polybar/launch.sh ${HOME}/.config/polybar/launch.sh
                cp rofi/config.rasi.nep ${HOME}/.config/rofi/config.rasi
                cp compton/* ${HOME}/.config/compton/.
                ln -sf ~/.cache/wal/zathurarc ~/.config/zathura/zathurarc
                cp -r ranger/* ${HOME}/.config/ranger/.
                ./install-scripts/uncomment.sh N ranger/rifle.conf ${HOME}/.config/ranger/rifle.conf
                cp -r nvim/* ${HOME}/.config/nvim/.
                ./install-scripts/uncomment.sh N kitty/kitty.conf ${HOME}/.config/kitty/kitty.conf
                ./install-scripts/uncomment.sh N .Xresources ${HOME}/.Xresources
                ln -sf ~/.cache/wal/dunstrc ${HOME}/.config/dunst/dunstrc
                cp wal/templates/* ${HOME}/.config/wal/templates/.
                ./install-scripts/uncomment.sh N wal/templates/dunstrc ${HOME}/.config/wal/templates/dunstrc
                cp spotify-tui/* ${HOME}/.config/spotify-tui/.
                cp spotifyd/* ${HOME}/.config/spotifyd/.
                cp neofetch/* ${HOME}/.config/neofetch/.
                cp .bashrc ${HOME}/.
                cp .gitconfig ${HOME}/.
                cp .xprofile ${HOME}/.
                cp -r chrome ${HOME}/.mozilla/firefox/*.default-release/.
                cp android_messages/* ${HOME}/.config/'Android Messages'/.
                cp zoomus.conf ${HOME}/.config/.
                cp gtk/*.ini ${HOME}/.config/gtk-3.0/.
                cp gtk/*.ini ${HOME}/.config/gtk-4.0/.
                cp gtk/.* ${HOME}/.
                sudo cp -r fonts/* /usr/share/fonts/.
                sudo cp spotify-tui/spotify-tui.desktop /usr/share/applications/.
          
                # reminders 
                echo "|> REMEMBER TO:"
                echo "|> set layers.acceleration.force-enabled --> true TO PREVENT TARING IN FIREFOX"
                echo "|> change spotifyd password in the config"
                echo "|> import gpg and ssh keys"
                echo "|> set up busybox/dropbear server to headless decrypt at boot"
                echo "|> set up pass, and tasks*"
                echo "|> pair all bluetooth devices"
                echo "|> install Wolfram Wathematica"
                echo "|> install windows in VM"
                echo "|> set up spotifyd with your password and email"
        fi
fi


