#!/bin/bash
# run as sudo
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

cd /usr/share/applications
mkdir -p ../unused-applications

# remove any applications you dont launch from rofi
mv avahi-discover.desktop ../unused-applications/.
mv bssh.desktop ../unused-applications/.
mv bvnc.desktop ../unused-applications/.
mv compton.desktop ../unused-applications/.
mv feh.desktop ../unused-applications/.
mv lstopo.desktop ../unused-applications/.
mv redshift.desktop ../unused-applications/.
mv qv4l2.desktop ../unused-applications/.
mv qvidcap.desktop ../unused-applications/.
mv redshift-gtk.desktop ../unused-applications/.
mv electron.desktop ../unused-applications/.
mv electron4.desktop ../unused-applications/.
mv electron5.desktop ../unused-applications/.
mv cmake-gui.desktop ../unused-applications/.
mv org.fontforge.FontForge.desktop ../unused-applications/.

# cups
sed -i '/Name=/d' ./cups.desktop
sed -i '/GenericName=/d' ./cups.desktop
sed -i "2iName=朗 CUPS" cups.desktop
sed -i "3iGenericName=Print Settings" cups.desktop

# siril
sed -i '/Name=/d' ./org.free_astro.siril.desktop
sed -i '/GenericName=/d' ./org.free_astro.siril.desktop
sed -i "2iName= Siril" org.free_astro.siril.desktop
sed -i "3iGenericName=Astro Image Processing" org.free_astro.siril.desktop

# zoom
sed -i '/Name=/d' ./Zoom.desktop
sed -i '/GenericName=/d' ./Zoom.desktop
sed -i "2iName= Zoom" Zoom.desktop
sed -i "3iGenericName=Video Confrencing" Zoom.desktop

# google earth
sed -i '/Name=/d' ./google-earth-pro.desktop
sed -i '/GenericName=/d' ./google-earth-pro.desktop
sed -i "2iName= Google Earth" google-earth-pro.desktop
sed -i "3iGenericName=3D Planet Viewer" google-earth-pro.desktop

# remmina 
sed -i '/Name=/d' ./org.remmina.Remmina.desktop
sed -i '/GenericName=/d' ./org.remmina.Remmina.desktop
sed -i "2iName= Remmina" org.remmina.Remmina.desktop
sed -i "3iGenericName=Remote Desktop Client" org.remmina.Remmina.desktop

# mathematica 
sed -i '/Name=/d' ./wolfram-mathematica12.desktop
sed -i '/GenericName=/d' ./wolfram-mathematica12.desktop
sed -i "2iName= Mathematica" wolfram-mathematica12.desktop
sed -i "3iGenericName=Technical Computing" wolfram-mathematica12.desktop

# virtual box 
sed -i '/Name=/d' ./virtualbox.desktop
sed -i '/GenericName=/d' ./virtualbox.desktop
sed -i "2iName= VirtualBox" virtualbox.desktop
sed -i "3iGenericName=Virtualization" virtualbox.desktop

# android-messages-desktop 
sed -i '/Name=/d' ./android-messages-desktop.desktop
sed -i '/GenericName=/d' ./android-messages-desktop.desktop
sed -i "2iName= Android Messages" android-messages-desktop.desktop
sed -i "3iGenericName=SMS Messaging" android-messages-desktop.desktop

# inkscape 
sed -i '/Name=/d' ./org.inkscape.Inkscape.desktop
sed -i '/GenericName=/d' ./org.inkscape.Inkscape.desktop
sed -i "2iName= Inkscape" org.inkscape.Inkscape.desktop
sed -i "3iGenericName=Vector Graphics Editor" org.inkscape.Inkscape.desktop

# firefox
sed -i '/Name=/d' ./firefox.desktop
sed -i '/GenericName=/d' ./firefox.desktop
sed -i "2iName= Firefox" firefox.desktop
sed -i "3iGenericName=Web Browser" firefox.desktop

# zoom
sed -i '/Name=/d' ./org.pwmt.zathura.desktop
sed -i '/GenericName=/d' ./org.pwmt.zathura.desktop
sed -i "2iName= Zathura" org.pwmt.zathura.desktop
sed -i "3iGenericName=PDF Reader" org.pwmt.zathura.desktop

# steam
sed -i '/Name=/d' ./steam.desktop
sed -i '/GenericName=/d' ./steam.desktop
sed -i "2iName= Steam" steam.desktop
sed -i "3iGenericName=Games" steam.desktop

# spotify
sed -i '/Name=/d' ./spotify.desktop
sed -i '/GenericName=/d' ./spotify.desktop
sed -i "2iName=阮 Spotify" spotify.desktop
sed -i "3iGenericName=Music Player" spotify.desktop

# spotify-tui
sed -i '/Name=/d' ./spotify-tui.desktop
sed -i '/GenericName=/d' ./spotify-tui.desktop
sed -i "2iName=阮 Spotify TUI" spotify-tui.desktop
sed -i "3iGenericName=TUI Music Player" spotify-tui.desktop

# ranger 
sed -i '/Name=/d' ./ranger.desktop
sed -i '/GenericName=/d' ./ranger.desktop
sed -i "2iName= Ranger" ranger.desktop
sed -i "3iGenericName=File Browser" ranger.desktop

# kitty 
sed -i '/Name=/d' ./kitty.desktop
sed -i '/GenericName=/d' ./kitty.desktop
sed -i "2iName= Kitty" kitty.desktop
sed -i "3iGenericName=Terminal Emulator" kitty.desktop

# cheese
sed -i '/Name=/d' ./org.gnome.Cheese.desktop
sed -i '/GenericName=/d' ./org.gnome.Cheese.desktop
sed -i "2iName= Cheese" org.gnome.Cheese.desktop
sed -i "3iGenericName=Camera" org.gnome.Cheese.desktop

# pulse audio
sed -i '/Name=/d' ./pavucontrol.desktop
sed -i '/GenericName=/d' ./pavucontrol.desktop
sed -i "2iName= Pulse Audio" pavucontrol.desktop
sed -i "3iGenericName=Audio Control" pavucontrol.desktop

# vim 
sed -i '/Name=/d' ./vim.desktop
sed -i '/GenericName=/d' ./vim.desktop
sed -i "2iName= Vim" vim.desktop
sed -i "3iGenericName=Text Editor" vim.desktop

# htop 
sed -i '/Name=/d' ./htop.desktop
sed -i '/GenericName=/d' ./htop.desktop
sed -i "2iName= Htop" htop.desktop
sed -i "3iGenericName=Process Viewer" htop.desktop

# cmake 
#sed -i '/Name=/d' ./cmake-gui.desktop
#sed -i '/GenericName=/d' ./cmake-gui.desktop
#sed -i "2iName= CMake" cmake-gui.desktop
#sed -i "3iGenericName=C Compiler" camke-gui.desktop

# vlc 
sed -i '/Name=/d' ./vlc.desktop
sed -i '/GenericName=/d' ./vlc.desktop
sed -i "2iName=嗢 VLC" vlc.desktop
sed -i "3iGenericName=Media Player" vlc.desktop

# atom 
sed -i '/Name=/d' ./atom.desktop
sed -i '/GenericName=/d' ./atom.desktop
sed -i "2iName= Atom" atom.desktop
sed -i "3iGenericName=Text Editor" atom.desktop

# neovim 
sed -i '/Name=/d' ./nvim.desktop
sed -i '/GenericName=/d' ./nvim.desktop
sed -i "2iName= Neovim" nvim.desktop
sed -i "3iGenericName=Text Editor" nvim.desktop

# darktable 
sed -i '/Name=/d' ./darktable.desktop
sed -i '/GenericName=/d' ./darktable.desktop
sed -i "2iName= Darktable" darktable.desktop
sed -i "3iGenericName=Lighttable and Darkroom" darktable.desktop

# gimp
sed -i '/Name=/d' ./gimp.desktop
sed -i '/GenericName=/d' ./gimp.desktop
sed -i "2iName= GIMP" gimp.desktop
sed -i "3iGenericName=Image Editor" gimp.desktop

# libreoffice 
sed -i '/Name=/d' ./libreoffice-startcenter.desktop
sed -i '/GenericName=/d' ./libreoffice-startcenter.desktop
sed -i "2iName= LibreOffice" libreoffice-startcenter.desktop
sed -i "3iGenericName=Office Suite" libreoffice-startcenter.desktop

sed -i '/Name=/d' ./libreoffice-writer.desktop
sed -i '/GenericName=/d' ./libreoffice-writer.desktop
sed -i "2iName= LibreOffice Writer" libreoffice-writer.desktop
sed -i "3iGenericName=Word Processor" libreoffice-writer.desktop

sed -i '/Name=/d' ./libreoffice-calc.desktop
sed -i '/GenericName=/d' ./libreoffice-calc.desktop
sed -i "2iName= LibreOffice Calc" libreoffice-calc.desktop
sed -i "3iGenericName=Spreadsheet" libreoffice-calc.desktop

sed -i '/Name=/d' ./libreoffice-impress.desktop
sed -i '/GenericName=/d' ./libreoffice-impress.desktop
sed -i "2iName=蠟 LibreOffice Impress" libreoffice-impress.desktop
sed -i "3iGenericName=Presentation" libreoffice-impress.desktop

sed -i '/Name=/d' ./libreoffice-draw.desktop
sed -i '/GenericName=/d' ./libreoffice-draw.desktop
sed -i "2iName= LibreOffice Draw" libreoffice-draw.desktop
sed -i "3iGenericName=Drawing Program" libreoffice-draw.desktop

sed -i '/Name=/d' ./libreoffice-base.desktop
sed -i '/GenericName=/d' ./libreoffice-base.desktop
sed -i "2iName= LibreOffice Base" libreoffice-base.desktop
sed -i "3iGenericName=Database" libreoffice-base.desktop

sed -i '/Name=/d' ./libreoffice-math.desktop
sed -i '/GenericName=/d' ./libreoffice-math.desktop
sed -i "2iName=烈 LibreOffice Math" libreoffice-math.desktop
sed -i "3iGenericName=Formula Editor" libreoffice-math.desktop

exit
