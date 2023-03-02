#!/bin/bash
# by ian k. bania (feb '20)
# lets me easily compare my local differences in dotfiles to the ones in the repo, so i dont overwrite any edits i've made locally

# move to the directory the script is in
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd $DIR

echo "##### i3/config ######"
icdiff ../i3/config ~/.config/i3/config
echo "##### polybar/config ######"
icdiff ../polybar/config ~/.config/polybar/config
echo "##### polybar/launch.sh ######"
icdiff ../polybar/launch.sh ~/.config/polybar/launch.sh
echo "##### rofi/config ######"
icdiff ../rofi/config.rasi ~/.config/rofi/config.rasi
echo "##### compton/compton.conf ######"
icdiff ../compton/compton.conf ~/.config/compton/compton.conf
echo "##### spotify-tui/config.yml ######"
icdiff ../spotify-tui/config.yml ~/.config/spotify-tui/config.yml
echo "##### spotifyd/config ######"
icdiff ../spotifyd/config ~/.config/spotifyd/config
echo "##### slack-term/config ######"
icdiff ../slack-term/config ~/.config/slack-term/config
echo "##### ranger/rc.conf ######"
icdiff ../ranger/rc.conf ~/.config/ranger/rc.conf
echo "##### ranger/rifle.conf ######"
icdiff ../ranger/rifle.conf ~/.config/ranger/rifle.conf
echo "##### neofetch/config.conf ######"
icdiff ../neofetch/config.conf ~/.config/neofetch/config.conf
echo "##### .vimrc ######"
icdiff ../.vimrc ~/.vimrc
echo "##### nvim/init.vim ######"
icdiff ../nvim/init.vim ~/.config/nvim/init.vim
echo "##### wal/templates/colors-rofi-dark.rasi #####"
icdiff ../wal/templates/colors-rofi-dark.rasi ~/.config/wal/templates/colors-rofi-dark.rasi
echo "##### wal/templates/dunstrc #####"
icdiff ../wal/templates/dunstrc ~/.config/wal/templates/dunstrc
echo "##### wal/templates/zathurarc #####"
icdiff ../wal/templates/zathurarc ~/.config/wal/templates/zathurarc
echo "##### kitty/kitty.conf #####"
icdiff ../kitty/kitty.conf ~/.config/kitty/kitty.conf
echo "##### .bashrc ######"
icdiff ../.bashrc ~/.bashrc
echo "##### .Xresources ######"
icdiff ../.Xresources ~/.Xresources 
echo "##### spotify-tui/spotify-tui.desktop ######"
icdiff ../spotify-tui/spotify-tui.desktop ~/.config/spotify-tui/spotify-tui.desktop
echo "##### Android Messages/Settings ######"
icdiff ../android-messages-desktop/Settings ~/.config/android-messages-desktop/Settings
echo "##### gtk/dark.ini ######"
icdiff ../gtk/dark.ini ${HOME}/.config/gtk-3.0/dark.ini
icdiff ../gtk/dark.ini ${HOME}/.config/gtk-4.0/dark.ini
echo "##### gtk/light.ini ######"
icdiff ../gtk/light.ini ${HOME}/.config/gtk-3.0/light.ini
icdiff ../gtk/light.ini ${HOME}/.config/gtk-4.0/light.ini
echo "##### gtk/.gtkrc-2.0.dark ######"
icdiff ../gtk/.gtkrc-2.0.dark ${HOME}/.gtkrc-2.0.dark
echo "##### gtk/.gtkrc-2.0.light ######"
icdiff ../gtk/.gtkrc-2.0.light ${HOME}/.gtkrc-2.0.light
echo "##### gtk/.gtkrc-3.0.dark ######"
icdiff ../gtk/.gtkrc-3.0.dark ${HOME}/.gtkrc-3.0.dark
echo "##### gtk/.gtkrc-3.0.light ######"
icdiff ../gtk/.gtkrc-3.0.light ${HOME}/.gtkrc-3.0.light

echo "

"
echo "############### SCRIPTS ################"

cd ../scripts
for f in *.sh; do
        NAME=${f::-3}
        echo "########## "
        echo $NAME
        icdiff $f /bin/$NAME 
done

for f in *.py; do
        NAME=${f::-3}
        echo "########## "
        echo $NAME
        icdiff $f /bin/$NAME 
done
