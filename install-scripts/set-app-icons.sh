#!/bin/bash
# run as sudo

cp -r /usr/share/applications /usr/share/applications.old

cd /usr/share/applications

# remove any applications you dont launch from rofi
rm avahi-discover.desktop
rm bssh.desktop
rm bvnc.desktop
rm compton.desktop
rm feh.desktop
rm lstopo.desktop
rm redshift.desktop
rm qv4l2.desktop
rm qvidcap.desktop
rm redshift-gtk.desktop

# zoom
sed -i '/Name=/d' ./Zoom.desktop
sed -i '/GenericName=/d' ./Zoom.desktop
echo "Name= Zoom" >> Zoom.desktop
echo "GenericName=Video Confrencing" >> Zoom.desktop

# android-messages-desktop 
sed -i '/Name=/d' ./android-messages-desktop.desktop
sed -i '/GenericName=/d' ./android-messages-desktop.desktop
echo "Name= Android Messages" >> android-messages-desktop.desktop
echo "GenericName=SMS Messaging" >> android-messages-desktop.desktop

# firefox
sed -i '/Name=/d' ./firefox.desktop
sed -i '/GenericName=/d' ./firefox.desktop

# zoom
sed -i '/Name=/d' ./org.pwmt.zathura.desktop
sed -i '/GenericName=/d' ./org.pwmt.zathura.desktop
echo "Name= Zathura" >> org.pwmt.zathura.desktop
echo "GenericName=PDF Reader" >> org.pwmt.zathura.desktop

# steam
sed -i '/Name=/d' ./steam.desktop
sed -i '/GenericName=/d' ./steam.desktop
echo "Name= Steam" >> steam.desktop
echo "GenericName=Games" >> steam.desktop

# spotify
sed -i '/Name=/d' ./spotify.desktop
sed -i '/GenericName=/d' ./spotify.desktop
echo "Name=阮 Spotify" >> spotify.desktop
echo "GenericName=Music Player" >> spotify.desktop

# spotify-tui
sed -i '/Name=/d' ./spotify-tui.desktop
sed -i '/GenericName=/d' ./spotify-tui.desktop
echo "Name=阮 Spotify TUI" >> spotify-tui.desktop
echo "GenericName=TUI Music Player" >> spotify-tui.desktop

# ranger 
sed -i '/Name=/d' ./ranger.desktop
sed -i '/GenericName=/d' ./ranger.desktop
echo "Name= Ranger" >> ranger.desktop
echo "GenericName=File Browser" >> ranger.desktop

# kitty 
sed -i '/Name=/d' ./kitty.desktop
sed -i '/GenericName=/d' ./kitty.desktop
echo "Name= Kitty" >> kitty.desktop
echo "GenericName=Terminal Emulator" >> kitty.desktop

# cheese
sed -i '/Name=/d' ./org.gnome.Cheese.desktop
sed -i '/GenericName=/d' ./org.gnome.Cheese.desktop
echo "Name= Cheese" >> org.gnome.Cheese.desktop
echo "GenericName=Camera" >> org.gnome.Cheese.desktop

# pulse audio
sed -i '/Name=/d' ./pavucontrol.desktop
sed -i '/GenericName=/d' ./pavucontrol.desktop
echo "Name= Pulse Audio" >> pavucontrol.desktop
echo "GenericName=Audio Control" >> pavucontrol.desktop

# vim 
sed -i '/Name=/d' ./vim.desktop
sed -i '/GenericName=/d' ./vim.desktop
echo "Name= Vim" >> vim.desktop
echo "GenericName=Text Editor" >> vim.desktop

# htop 
sed -i '/Name=/d' ./htop.desktop
sed -i '/GenericName=/d' ./htop.desktop
echo "Name= Htop" >> htop.desktop
echo "GenericName=Process Viewer" >> htop.desktop

# cmake 
sed -i '/Name=/d' ./cmake-gui.desktop
sed -i '/GenericName=/d' ./cmake-gui.desktop
echo "Name= CMake" >> cmake-gui.desktop
echo "GenericName=C Compiler" >> camke-gui.desktop

# vlc 
sed -i '/Name=/d' ./vlc.desktop
sed -i '/GenericName=/d' ./vlc.desktop
echo "Name=嗢 VLC" >> vlc.desktop
echo "GenericName=Media Player" >> vlc.desktop

# atom 
sed -i '/Name=/d' ./atom.desktop
sed -i '/GenericName=/d' ./atom.desktop
echo "Name= Atom" >> atom.desktop
echo "GenericName=Text Editor" >> atom.desktop

# neovim 
sed -i '/Name=/d' ./nvim.desktop
sed -i '/GenericName=/d' ./nvim.desktop
echo "Name= Neovim" >> nvim.desktop
echo "GenericName=Text Editor" >> nvim.desktop

# darktable 
sed -i '/Name=/d' ./darktable.desktop
sed -i '/GenericName=/d' ./darktable.desktop
echo "Name= Darktable" >> darktable.desktop
echo "GenericName=Lighttable and Darkroom" >> darktable.desktop

# gimp
sed -i '/Name=/d' ./gimp.desktop
sed -i '/GenericName=/d' ./gimp.desktop
echo "Name= GIMP" >> gimp.desktop
echo "GenericName=Image Editor" >> gimp.desktop

# libreoffice 
sed -i '/Name=/d' ./libreoffice-startcenter.desktop
sed -i '/GenericName=/d' ./libreoffice-startcenter.desktop
echo "Name= LibreOffice" >> libreoffice-startcenter.desktop
echo "GenericName=Office Suite" >> libreoffice-startcenter.desktop

sed -i '/Name=/d' ./libreoffice-writer.desktop
sed -i '/GenericName=/d' ./libreoffice-writer.desktop
echo "Name= LibreOffice Writer" >> libreoffice-writer.desktop
echo "GenericName=Word Processor" >> libreoffice-writer.desktop

sed -i '/Name=/d' ./libreoffice-calc.desktop
sed -i '/GenericName=/d' ./libreoffice-calc.desktop
echo "Name= LibreOffice Calc" >> libreoffice-calc.desktop
echo "GenericName=Spreadsheet" >> libreoffice-calc.desktop

sed -i '/Name=/d' ./libreoffice-impress.desktop
sed -i '/GenericName=/d' ./libreoffice-impress.desktop
echo "Name=蠟 LibreOffice Impress" >> libreoffice-impress.desktop
echo "GenericName=Presentation" >> libreoffice-impress.desktop

sed -i '/Name=/d' ./libreoffice-draw.desktop
sed -i '/GenericName=/d' ./libreoffice-draw.desktop
echo "Name= LibreOffice Draw" >> libreoffice-draw.desktop
echo "GenericName=Drawing Program" >> libreoffice-draw.desktop

sed -i '/Name=/d' ./libreoffice-base.desktop
sed -i '/GenericName=/d' ./libreoffice-base.desktop
echo "Name= LibreOffice Base" >> libreoffice-base.desktop
echo "GenericName=Database" >> libreoffice-base.desktop

sed -i '/Name=/d' ./libreoffice-math.desktop
sed -i '/GenericName=/d' ./libreoffice-math.desktop
echo "Name=烈 LibreOffice Math" >> libreoffice-math.desktop
echo "GenericName=Formula Editor" >> libreoffice-math.desktop

exit
