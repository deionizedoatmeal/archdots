#!/bin/bash
# run as sudo
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

cd /home/ian/.local/share/applications/

# kite 
sed -i '/Name=/d' ./kite.desktop
sed -i '/GenericName=/d' ./kite.desktop
sed -i "3iName= Kite " kite.desktop
sed -i "4iGenericName=AI Code" kite.desktop

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
mv electron6.desktop ../unused-applications/.
mv cmake-gui.desktop ../unused-applications/.
mv org.fontforge.FontForge.desktop ../unused-applications/.
mv QMLPlayer.desktop ../unused-applications/.
mv Player.desktop ../unused-applications/.
mv org.kde.showfoto.desktop ../unused-applications/.
mv xdvi.desktop ../unused-applications/.
mv picom.desktop ../unused-applications/.
mv picom.desktop ../unused-applications/.
mv stoken-gui-small.desktop ../unused-applications/.
mv stoken-gui.desktop ../unused-applications/.
mv ipython.desktop ../unused-applications/.
mv java-java-openjdk.desktop ../unused-applications/.
mv jconsole-java-openjdk.desktop ../unused-applications/.
mv jshell-java-openjdk.desktop ../unused-applications/.


# top cat 
sed -i '/Name=/d' ./topcat.desktop
sed -i '/GenericName=/d' ./topcat.desktop
sed -i "2iName= Topcat" topcat.desktop
sed -i "3iGenericName=CSV Plotter" topcat.desktop

# blueman manager
sed -i '/Name=/d' ./blueman-manager.desktop
sed -i '/GenericName=/d' ./blueman-manager.desktop
sed -i "2iName= Blueman" blueman-manager.desktop
sed -i "3iGenericName=Bluetooth Manager" blueman-manager.desktop

# blueman adapters
sed -i '/Name=/d' ./blueman-adapters.desktop
sed -i '/GenericName=/d' ./blueman-adapters.desktop
sed -i "2iName= Blueman" blueman-adapters.desktop
sed -i "3iGenericName=Bluetooth Adapters" blueman-adapters.desktop

# blender 
sed -i '/Name=/d' ./blender.desktop
sed -i '/GenericName=/d' ./blender.desktop
sed -i "2iName= Blender" blender.desktop
sed -i "3iGenericName=3D Modeler" blender.desktop

# digiKam 
sed -i '/Name=/d' ./org.kde.digikam.desktop
sed -i '/GenericName=/d' ./org.kde.digikam.desktop
sed -i "2iName= DigiKam" org.kde.digikam.desktop
sed -i "3iGenericName=Photo Management Program" org.kde.digikam.desktop

# slack
sed -i '/Name=/d' ./slack.desktop
sed -i '/GenericName=/d' ./slack.desktop
sed -i "3iName= Slack" slack.desktop
sed -i "4iGenericName=Group Messaging" slack.desktop

# arduino 
sed -i '/Name=/d' ./arduino.desktop
sed -i '/GenericName=/d' ./arduino.desktop
sed -i "3iName= Arduino" arduino.desktop
sed -i "4iGenericName=Microcontroler IDE" arduino.desktop

# kdenlive 
sed -i '/Name=/d' ./org.kde.kdenlive.desktop
sed -i '/GenericName=/d' ./org.kde.kdenlive.desktop
sed -i "3iName= Kdenlive" org.kde.kdenlive.desktop
sed -i "4iGenericName=Video Editor" org.kde.kdenlive.desktop

# arandr 
sed -i '/Name=/d' ./arandr.desktop
sed -i '/GenericName=/d' ./arandr.desktop
sed -i "2iName= Arnadr" arandr.desktop
sed -i "3iGenericName=Display Settings" arandr.desktop

# cups
sed -i '/Name=/d' ./cups.desktop
sed -i '/GenericName=/d' ./cups.desktop
sed -i "2iName=朗 CUPS" cups.desktop
sed -i "3iGenericName=Print Settings" cups.desktop

# siril
sed -i '/Name=/d' ./org.free_astro.siril.desktop
sed -i '/GenericName=/d' ./org.free_astro.siril.desktop
sed -i "2iName= Siril" org.free_astro.siril.desktop
sed -i "3iGenericName=Astro Image Processing" org.free_astro.siril.desktop

# imagej 
sed -i '/Name=/d' ./imagej.desktop
sed -i '/GenericName=/d' ./imagej.desktop
sed -i "2iName= ImageJ" imagej.desktop
sed -i "3iGenericName=Technical Image Processing" imagej.desktop

# astrimagej 
sed -i '/Name=/d' ./astroimagej.desktop
sed -i '/GenericName=/d' ./astroimagej.desktop
sed -i "2iName= Astro ImageJ" astroimagej.desktop
sed -i "3iGenericName=Astro Image Processing" astroimagej.desktop

# ds9
sed -i '/Name=/d' ./ds9.desktop
sed -i '/GenericName=/d' ./ds9.desktop
sed -i "2iName= DS9" ds9.desktop
sed -i "3iGenericName=Astro Image Processing" ds9.desktop


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

# qgis
sed -i '/Name=/d' ./org.qgis.qgis.desktop
sed -i '/GenericName=/d' ./org.qgis.qgis.desktop
sed -i "2iName= QGIS" org.qgis.qgis.desktop
sed -i "3iGenericName=Geographic Information System" org.qgis.qgis.desktop

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
sed -i "4iName= Inkscape" org.inkscape.Inkscape.desktop
sed -i "5iGenericName=Vector Graphics Editor" org.inkscape.Inkscape.desktop

# firefox
sed -i '/Name=/d' ./firefox.desktop
sed -i '/GenericName=/d' ./firefox.desktop
sed -i "2iName= Firefox" firefox.desktop
sed -i "3iGenericName=Web Browser" firefox.desktop

# zoom
sed -i '/Name=/d' ./org.pwmt.zathura.desktop
sed -i '/GenericName=/d' ./org.pwmt.zathura.desktop
sed -i "2iName= Zathura" org.pwmt.zathura.desktop
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

# ytop 
sed -i '/Name=/d' ./bottom.desktop
sed -i '/GenericName=/d' ./bottom.desktop
sed -i "2iName= Bottom" bottom.desktop
sed -i "3iGenericName=Process Viewer" bottom.desktop

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
sed -i "3iGenericName=Audio Settings" pavucontrol.desktop

# pulse audio prefs
sed -i '/Name=/d' ./paprefs.desktop
sed -i '/GenericName=/d' ./paprefs.desktop
sed -i "3iName= Pulse Audio" paprefs.desktop
sed -i "4iGenericName=Audio Preferences" paprefs.desktop

# vim 
sed -i '/Name=/d' ./vim.desktop
sed -i '/GenericName=/d' ./vim.desktop
sed -i "2iName= Vim" vim.desktop
sed -i "3iGenericName=Text Editor" vim.desktop

# htop 
sed -i '/Name=/d' ./htop.desktop
sed -i '/GenericName=/d' ./htop.desktop
sed -i "2iName= Htop" htop.desktop
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
sed -i "2iName= Atom" atom.desktop
sed -i "3iGenericName=Text Editor" atom.desktop

# neovim 
sed -i '/Name=/d' ./nvim.desktop
sed -i '/GenericName=/d' ./nvim.desktop
sed -i "2iName= Neovim" nvim.desktop
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
sed -i "24iName= LibreOffice" libreoffice-startcenter.desktop
sed -i "25iGenericName=Office Suite" libreoffice-startcenter.desktop

sed -i '/Name=/d' ./libreoffice-writer.desktop
sed -i '/GenericName=/d' ./libreoffice-writer.desktop
sed -i "24iName= LibreOffice Writer" libreoffice-writer.desktop
sed -i "25iGenericName=Word Processor" libreoffice-writer.desktop

sed -i '/Name=/d' ./libreoffice-calc.desktop
sed -i '/GenericName=/d' ./libreoffice-calc.desktop
sed -i "24iName= LibreOffice Calc" libreoffice-calc.desktop
sed -i "25iGenericName=Spreadsheet" libreoffice-calc.desktop

sed -i '/Name=/d' ./libreoffice-impress.desktop
sed -i '/GenericName=/d' ./libreoffice-impress.desktop
sed -i "24iName=蠟 LibreOffice Impress" libreoffice-impress.desktop
sed -i "25iGenericName=Presentation" libreoffice-impress.desktop

sed -i '/Name=/d' ./libreoffice-draw.desktop
sed -i '/GenericName=/d' ./libreoffice-draw.desktop
sed -i "24iName= LibreOffice Draw" libreoffice-draw.desktop
sed -i "25iGenericName=Drawing Program" libreoffice-draw.desktop

sed -i '/Name=/d' ./libreoffice-base.desktop
sed -i '/GenericName=/d' ./libreoffice-base.desktop
sed -i "24iName= LibreOffice Base" libreoffice-base.desktop
sed -i "25iGenericName=Database" libreoffice-base.desktop

sed -i '/Name=/d' ./libreoffice-math.desktop
sed -i '/GenericName=/d' ./libreoffice-math.desktop
sed -i "24iName=烈 LibreOffice Math" libreoffice-math.desktop
sed -i "25iGenericName=Formula Editor" libreoffice-math.desktop

sed -i '/Name=/d' ./jupyter-lab.desktop
sed -i '/GenericName=/d' ./jupyter-lab.desktop
sed -i "24iName= Jupyter Lab" jupyter-lab.desktop
sed -i "25iGenericName=Python IDE" jupyter-lab.desktop

sed -i '/Name=/d' ./remarkable.desktop
sed -i '/GenericName=/d' ./remarkable.desktop
sed -i "24iName= ReMarkable" remarkable.desktop
sed -i "25iGenericName=eInk Client" remarkable.desktop

exit
