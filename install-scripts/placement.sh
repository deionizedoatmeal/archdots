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

#move dotfiles into corresponding config directories
cd ..
cp -r i3/* ~/.config/i3/
cp -r polybar/* ~/.config/polybar/
cp -r rofi/* ~/.config/rofi/
cp -r compton/* ~/.config/compton/
cp -r zathura/* ~/.config/zathura/
cp -r ranger/* ~/.config/ranger/
cp -r nvim/* ~/.config/nvim/
cp -r kitty/* ~/.config/kitty/
ln -sf ~/.cache/wal/dunstrc ~/.config/dunst/dunstrc
cp -r wal/* ~/.config/wal/
cp -r spotify-tui/* ~/.config/spotify-tui/
cp -r spotifyd/* ~/.config/spotifyd/
cp .bashrc ~/.
cp .Xresources ~/.
cp -r chrome ~/.mozilla/firefox/*.default-release/.
cp -r android_messages ~/.config/'Android Messages'/.
cp zoomus.conf ~/.config/.
sudo cp -r fonts/* /usr/share/fonts/.
#sudo cp ranger/ranger.desktop /usr/share/applications/.
#sudo cp spotify-tui/spotify-tui.desktop /usr/share/applications/.
echo "|> REMBER TO:"
echo "|> set layers.acceleration.force-enabled --> true TO PREVENT TARING IN FIREFOX"
echo "|> change spotifyd password in the config"
echo "|> import gpg and ssh keys"
echo "|> run powertop and tlp"
echo "|> set up pass, and tasks"
echo "|> pair all bluetooth devices"



