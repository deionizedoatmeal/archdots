#!/usr/bin/env bash
#places all the dotfiles and scripts into my system where i need them

cd "${0%/*}"

#move scripts to bin and rename them to remove .sh
cd ../scripts
for f in *.sh; do
NAME=${f::-3}
sudo cp -p $f /bin/$NAME
done

for f in *.py; do
NAME=${f::-3}
sudo cp -p $f /bin/$NAME
done

mkdir ~/.config/i3/
mkdir ~/.config/polybar/
mkdir ~/.config/rofi/
mkdir ~/.config/compton/
mkdir ~/.config/zathura/
mkdir ~/.config/nvim/
mkdir ~/.config/ranger/
mkdir ~/.config/dunst/
mkdir ~/.config/wal/templates/
mkdir ~/.config/spotify-tui/
mkdir ~/.config/spotifyd/
mkdir ~/.config/wal/
mkdir ~/.config/'Android Messages'/
mkdir ~/.config/gtk-3.0/
mkdir ~/.config/gtk-4.0/

#move dotfiles into corresponding config directories
cd ..
cp -r i3/* ~/.config/i3/
cp -r polybar/* ~/.config/polybar/
cp -r rofi/* ~/.config/rofi/
cp -r compton/* ~/.config/compton/
ln -sf ~/.cache/wal/zathurarc ~/.config/zathura/zathurarc
cp -r ranger/* ~/.config/ranger/
cp -r nvim/* ~/.config/nvim/
cp -r kitty/* ~/.config/kitty/
ln -sf ~/.cache/wal/dunstrc ~/.config/dunst/dunstrc
cp -r wal/* ~/.config/wal/
cp -r spotify-tui/* ~/.config/spotify-tui/
cp -r spotifyd/* ~/.config/spotifyd/
cp .bashrc ~/.
cp .Xresources ~/.
cp .gitconfig ~/.
cp .xprofile ~/.
cp -r chrome ~/.mozilla/firefox/*.default-release/.
cp -r android_messages ~/.config/'Android Messages'/.
cp zoomus.conf ~/.config/.
cp gtk/*.ini ${HOME}/.config/gtk-3.0/.
cp gtk/*.ini ${HOME}/.config/gtk-4.0/.
cp gtk/.* ${HOME}/.
sudo cp -r fonts/* /usr/share/fonts/.
#sudo cp ranger/ranger.desktop /usr/share/applications/.
#sudo cp spotify-tui/spotify-tui.desktop /usr/share/applications/.
echo "|> REMEMBER TO:"
echo "|> set layers.acceleration.force-enabled --> true TO PREVENT TARING IN FIREFOX"
echo "|> choose between triton and neptune options in configs on i3, polybar, launch.sh, rofi, and kitty, .Xresources, .xprofile"
echo "|> change spotifyd password in the config"
echo "|> import gpg and ssh keys"
echo "|> set up busybox/dropbear server to headless decrypt at boot"
echo "|> run powertop and tlp"
echo "|> set up pass, and tasks"
echo "|> pair all bluetooth devices"
echo "|> install Wolfram Wathematica"
echo "|> install windows in VM"
echo "|> set up spotifyd"



