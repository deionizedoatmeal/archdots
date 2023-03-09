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
sed -i -e '$aNoDisplay=true' yad-settings.desktop
sed -i -e '$aNoDisplay=true' yad-icon-browser.desktop
sed -i -e '$aNoDisplay=true' avahi-discover.desktop
sed -i -e '$aNoDisplay=true' bssh.desktop
sed -i -e '$aNoDisplay=true' bvnc.desktop
sed -i -e '$aNoDisplay=true' compton.desktop
sed -i -e '$aNoDisplay=true' lstopo.desktop
sed -i -e '$aNoDisplay=true' redshift.desktop
sed -i -e '$aNoDisplay=true' qv4l2.desktop
sed -i -e '$aNoDisplay=true' qvidcap.desktop
sed -i -e '$aNoDisplay=true' redshift-gtk.desktop
sed -i -e '$aNoDisplay=true' electron.desktop
sed -i -e '$aNoDisplay=true' electron4.desktop
sed -i -e '$aNoDisplay=true' electron5.desktop
sed -i -e '$aNoDisplay=true' electron6.desktop
sed -i -e '$aNoDisplay=true' electron9.desktop
sed -i -e '$aNoDisplay=true' electron11.desktop
sed -i -e '$aNoDisplay=true' electron17.desktop
sed -i -e '$aNoDisplay=true' cmake-gui.desktop
sed -i -e '$aNoDisplay=true' org.fontforge.FontForge.desktop
sed -i -e '$aNoDisplay=true' QMLPlayer.desktop
sed -i -e '$aNoDisplay=true' Player.desktop
sed -i -e '$aNoDisplay=true' org.kde.showfoto.desktop
sed -i -e '$aNoDisplay=true' xdvi.desktop
sed -i -e '$aNoDisplay=true' picom.desktop
sed -i -e '$aNoDisplay=true' stoken-gui-small.desktop
sed -i -e '$aNoDisplay=true' stoken-gui.desktop
sed -i -e '$aNoDisplay=true' ipython.desktop
sed -i -e '$aNoDisplay=true' calibre-ebook-edit.desktop
sed -i -e '$aNoDisplay=true' calibre-ebook-viewer.desktop
sed -i -e '$aNoDisplay=true' calibre-lrfviewer.desktop
sed -i -e '$aNoDisplay=true' org.freedesktop.IBus.Panel.Emojier.desktop
sed -i -e '$aNoDisplay=true' org.freedesktop.IBus.Panel.Extension.Gtk3.desktop
sed -i -e '$aNoDisplay=true' org.freedesktop.IBus.Setup.desktop
sed -i -e '$aNoDisplay=true' assistant.desktop
sed -i -e '$aNoDisplay=true' designer.desktop
sed -i -e '$aNoDisplay=true' linguist.desktop
sed -i -e '$aNoDisplay=true' qdbusviewer.desktop
sed -i -e '$aNoDisplay=true' system76-driver.desktop
sed -i -e '$aNoDisplay=true' bitmap2component.desktop
sed -i -e '$aNoDisplay=true' eeschema.desktop
sed -i -e '$aNoDisplay=true' pcbnew.desktop
sed -i -e '$aNoDisplay=true' pcbcalculator.desktop
sed -i -e '$aNoDisplay=true' gerbview.desktop
sed -i -e '$aNoDisplay=true' org.kicad.bitmap2component.desktop
sed -i -e '$aNoDisplay=true' org.kicad.eeschema.desktop
sed -i -e '$aNoDisplay=true' org.kicad.pcbnew.desktop
sed -i -e '$aNoDisplay=true' org.kicad.pcbcalculator.desktop
sed -i -e '$aNoDisplay=true' org.kicad.gerbview.desktop
sed -i -e '$aNoDisplay=true' gnome-user-accounts-panel.desktop 
sed -i -e '$aNoDisplay=true' jconsole-java11-openjdk.desktop
sed -i -e '$aNoDisplay=true' jshell-java11-openjdk.desktop
sed -i -e '$aNoDisplay=true' java-java11-openjdk.desktop
sed -i -e '$aNoDisplay=true' java-java-openjdk.desktop
sed -i -e '$aNoDisplay=true' jconsole-java-openjdk.desktop
sed -i -e '$aNoDisplay=true' jshell-java-openjdk.desktop
sed -i -e '$aNoDisplay=true' grafana.desktop 
sed -i -e '$aNoDisplay=true' rofi.desktop 
sed -i -e '$aNoDisplay=true' rofi-theme-selector.desktop 
sed -i -e '$aNoDisplay=true' xterm.desktop 
sed -i -e '$aNoDisplay=true' uxterm.desktop 


# top cat 
sed -i '/Name=/d' ./topcat.desktop
sed -i '/GenericName=/d' ./topcat.desktop
sed -i "2iName= Topcat" topcat.desktop
sed -i "3iGenericName=CSV Plotter" topcat.desktop

# df 
sed -i '/Name=/d' ./dwarffortress.desktop
sed -i '/GenericName=/d' ./dwarffortress.desktop
sed -i "2iName= Dwarf Fortress" dwarffortress.desktop
sed -i "3iGenericName=TUI Game" dwarffortress.desktop

# blueman manager
sed -i '/Name=/d' ./blueman-manager.desktop
sed -i '/GenericName=/d' ./blueman-manager.desktop
sed -i "2iName= Blueman" blueman-manager.desktop
sed -i "3iGenericName=Bluetooth Manager" blueman-manager.desktop

# blueman adapters
sed -i '/Name=/d' ./blueman-adapters.desktop
sed -i '/GenericName=/d' ./blueman-adapters.desktop
sed -i "2iName= Blueman" blueman-adapters.desktop
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
sed -i "2iName= CUPS" cups.desktop
sed -i "3iGenericName=Print Settings" cups.desktop

# iscan
sed -i '/Name=/d' ./iscan.desktop
sed -i '/GenericName=/d' ./iscan.desktop
sed -i "2iName= Image Scan" iscan.desktop
sed -i "3iGenericName=Document Scanner" iscan.desktop

# simple scan
sed -i '/Name=/d' ./simple-scan.desktop
sed -i '/GenericName=/d' ./simple-scan.desktop
sed -i "2iName= Simple Scan" simple-scan.desktop
sed -i "3iGenericName=Document Scanner" simple-scan.desktop

# siril
sed -i '/Name=/d' ./org.free_astro.siril.desktop
sed -i '/GenericName=/d' ./org.free_astro.siril.desktop
sed -i "2iName= Siril" org.free_astro.siril.desktop
sed -i "3iGenericName=Astro Image Processing" org.free_astro.siril.desktop

# imagej 
sed -i '/Name=/d' ./imagej.desktop
sed -i '/GenericName=/d' ./imagej.desktop
sed -i "2iName= ImageJ" imagej.desktop
sed -i "3iGenericName=Technical Image Processing" imagej.desktop

# fiji 
sed -i '/Name=/d' ./fiji.desktop
sed -i '/GenericName=/d' ./fiji.desktop
sed -i "2iName= Fiji" fiji.desktop
sed -i "3iGenericName=Technical Image Processing" fiji.desktop

# astrimagej 
sed -i '/Name=/d' ./astroimagej.desktop
sed -i '/GenericName=/d' ./astroimagej.desktop
sed -i "2iName= Astro ImageJ" astroimagej.desktop
sed -i "3iGenericName=Astro Image Processing" astroimagej.desktop

# ds9
sed -i '/Name=/d' ./ds9.desktop
sed -i '/GenericName=/d' ./ds9.desktop
sed -i "2iName= DS9" ds9.desktop
sed -i "3iGenericName=Astro Image Processing" ds9.desktop


# zoom
sed -i '/Name=/d' ./Zoom.desktop
sed -i '/GenericName=/d' ./Zoom.desktop
sed -i "2iName= Zoom" Zoom.desktop
sed -i "3iGenericName=Video Confrencing" Zoom.desktop

# google earth
sed -i '/Name=/d' ./google-earth-pro.desktop
sed -i '/GenericName=/d' ./google-earth-pro.desktop
sed -i "2iName= Google Earth" google-earth-pro.desktop
sed -i "3iGenericName=3D Planet Viewer" google-earth-pro.desktop

# google chrome 
sed -i '/Name=/d' ./google-chrome.desktop
sed -i '/GenericName=/d' ./google-chrome.desktop
sed -i "2iName= Chrome" google-chrome.desktop
sed -i "3iGenericName=Web Browser" google-chrome.desktop

# qgis
sed -i '/Name=/d' ./org.qgis.qgis.desktop
sed -i '/GenericName=/d' ./org.qgis.qgis.desktop
sed -i "2iName= QGIS" org.qgis.qgis.desktop
sed -i "3iGenericName=Geographic Information System" org.qgis.qgis.desktop

# remmina 
sed -i '/Name=/d' ./org.remmina.Remmina.desktop
sed -i '/GenericName=/d' ./org.remmina.Remmina.desktop
sed -i "2iName= Remmina" org.remmina.Remmina.desktop
sed -i "3iGenericName=Remote Desktop Client" org.remmina.Remmina.desktop

# teamviewer 
sed -i '/Name=/d' ./com.teamviewer.TeamViewer.desktop
sed -i '/GenericName=/d' ./com.teamviewer.TeamViewer.desktop
sed -i "2iName= TeamViewer" com.teamviewer.TeamViewer.desktop
sed -i "3iGenericName=Remote Desktop Client" com.teamviewer.TeamViewer.desktop

# Popsicle 
sed -i '/Name=/d' ./com.system76.Popsicle.desktop
sed -i '/GenericName=/d' ./com.system76.Popsicle.desktop
sed -i "4iName= Popscile" com.system76.Popsicle.desktop
sed -i "5iGenericName=ISO Flasher" com.system76.Popsicle.desktop

# mathematica 
sed -i '/Name=/d' ./wolfram-mathematica12.desktop
sed -i '/GenericName=/d' ./wolfram-mathematica12.desktop
sed -i "2iName= Mathematica" wolfram-mathematica12.desktop
sed -i "3iGenericName=Technical Computing" wolfram-mathematica12.desktop

# virtual box 
sed -i '/Name=/d' ./virtualbox.desktop
sed -i '/GenericName=/d' ./virtualbox.desktop
sed -i "2iName= VirtualBox" virtualbox.desktop
sed -i "3iGenericName=Virtualization" virtualbox.desktop

# android-messages-desktop 
sed -i '/Name=/d' ./AndroidMessages.desktop
sed -i '/GenericName=/d' ./AndroidMessages.desktop
sed -i "2iName= Android Messages" AndroidMessages.desktop
sed -i "3iGenericName=SMS Messaging" AndroidMessages.desktop

# inkscape 
sed -i '/Name=/d' ./org.inkscape.Inkscape.desktop
sed -i '/GenericName=/d' ./org.inkscape.Inkscape.desktop
sed -i "4iName= Inkscape" org.inkscape.Inkscape.desktop
sed -i "5iGener Name=Vector Graphics Editor" org.inkscape.Inkscape.desktop

# firefox
sed -i '/Name=/d' ./firefox.desktop
sed -i '/GenericName=/d' ./firefox.desktop
sed -i "2iName= Firefox" firefox.desktop
sed -i "3iGenericName=Web Browser" firefox.desktop

# zathura
sed -i '/Name=/d' ./org.pwmt.zathura.desktop
sed -i '/GenericName=/d' ./org.pwmt.zathura.desktop
sed -i "2iName= Zathura" org.pwmt.zathura.desktop
sed -i "3iGenericName=PDF Reader" org.pwmt.zathura.desktop

sed -i '/Name=/d' ./org.gnome.Evince.desktop
sed -i '/GenericName=/d' ./org.gnome.Evince.desktop
sed -i "8iName= Evince" org.gnome.Evince.desktop
sed -i "9iGenericName=PDF Reader" org.gnome.Evince.desktop

# calibre
sed -i '/Name=/d' ./calibre-gui.desktop
sed -i '/GenericName=/d' ./calibre-gui.desktop
sed -i "2iName= Calibre" calibre-gui.desktop
sed -i "3iGenericName=Ebook Libray" calibre-gui.desktop

# steam
sed -i '/Name=/d' ./steam.desktop
sed -i '/GenericName=/d' ./steam.desktop
sed -i "2iName= Steam" steam.desktop
sed -i "3iGenericName=Games" steam.desktop

# spotify
sed -i '/Name=/d' ./spotify.desktop
sed -i '/GenericName=/d' ./spotify.desktop
sed -i "2iName= Spotify" spotify.desktop
sed -i "3iGenericName=Music Player" spotify.desktop

# spotify-tui
sed -i '/Name=/d' ./spotify-tui.desktop
sed -i '/GenericName=/d' ./spotify-tui.desktop
sed -i "2iName= Spotify TUI" spotify-tui.desktop
sed -i "3iGenericName=TUI Music Player" spotify-tui.desktop

# ranger 
sed -i '/Name=/d' ./ranger.desktop
sed -i '/GenericName=/d' ./ranger.desktop
sed -i "2iName= Ranger" ranger.desktop
sed -i "3iGenericName=File Browser" ranger.desktop

# nautilus 
sed -i '/Name=/d' ./org.gnome.Nautilus.desktop
sed -i '/GenericName=/d' ./org.gnome.Nautilus.desktop
sed -i "2iName= Nautilus" org.gnome.Nautilus.desktop
sed -i "3iGenericName=File Browser" org.gnome.Nautilus.desktop

# bottom
sed -i '/Name=/d' ./bottom.desktop
sed -i '/GenericName=/d' ./bottom.desktop
sed -i "2iName= Bottom" bottom.desktop
sed -i "3iGenericName=Process and Resource Viewer" bottom.desktop

# gpu
sed -i '/Name=/d' ./io.github.arunsivaramanneo.GPUViewer.desktop
sed -i '/GenericName=/d' ./io.github.arunsivaramanneo.GPUViewer.desktop
sed -i "2iName= GPU" io.github.arunsivaramanneo.GPUViewer.desktop
sed -i "3iGenericName=GPU Viewer" io.github.arunsivaramanneo.GPUViewer.desktop

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
sed -i "2iName= Pulse Audio" pavucontrol.desktop
sed -i "3iGenericName=Audio Settings" pavucontrol.desktop

# pulse audio prefs
sed -i '/Name=/d' ./paprefs.desktop
sed -i '/GenericName=/d' ./paprefs.desktop
sed -i "3iName= Pulse Audio" paprefs.desktop
sed -i "4iGenericName=Audio Preferences" paprefs.desktop

# vim 
sed -i '/Name=/d' ./vim.desktop
sed -i '/GenericName=/d' ./vim.desktop
sed -i "2iName= Vim" vim.desktop
sed -i "3iGenericName=Text Editor" vim.desktop

# gvim 
sed -i '/Name=/d' ./gvim.desktop
sed -i '/GenericName=/d' ./gvim.desktop
sed -i "2iName= Vim" gvim.desktop
sed -i "3iGenericName=Text Editor" gvim.desktop


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

# vscode 
sed -i '/Name=/d' ./code.desktop
sed -i '/GenericName=/d' ./code.desktop
sed -i "2iName= Visual Studio Code" code.desktop
sed -i "3iGenericName=IDE" code.deskto 
# neovim 
sed -i '/Name=/d' ./nvim.desktop
sed -i '/GenericName=/d' ./nvim.desktop
sed -i "2iName= Neovim" nvim.desktop
sed -i "3iGenericName=Text Editor" nvim.desktop

# darktable 
sed -i '/Name=/d' ./org.darktable.darktable.desktop
sed -i '/GenericName=/d' ./org.darktable.darktable.desktop
sed -i "2iName= Darktable" org.darktable.darktable.desktop
sed -i "3iGenericName=Light Table and Darkroom" org.darktable.darktable.desktop

# gimp
sed -i '/Name=/d' ./gimp.desktop
sed -i '/GenericName=/d' ./gimp.desktop
sed -i "2iName= GIMP" gimp.desktop
sed -i "3iGenericName=Image Editor" gimp.desktop

# gimp
sed -i '/Name=/d' ./feh.desktop
sed -i '/GenericName=/d' ./feh.desktop
sed -i "7iName= Feh" feh.desktop
sed -i "8iGenericName=Simple Image Viewer" feh.desktop

# libreoffice 
sed -i '/Name=/d' ./libreoffice-startcenter.desktop
sed -i '/GenericName=/d' ./libreoffice-startcenter.desktop
sed -i "24iName= LibreOffice" libreoffice-startcenter.desktop
sed -i "25iGenericName=Office Suite" libreoffice-startcenter.desktop

sed -i '/Name=/d' ./libreoffice-writer.desktop
sed -i '/GenericName=/d' ./libreoffice-writer.desktop
sed -i "24iName= LibreOffice Writer" libreoffice-writer.desktop
sed -i "25iGenericName=Word Processor" libreoffice-writer.desktop

sed -i '/Name=/d' ./libreoffice-calc.desktop
sed -i '/GenericName=/d' ./libreoffice-calc.desktop
sed -i "24iName= LibreOffice Calc" libreoffice-calc.desktop
sed -i "25iGenericName=Spread sheet" libreoffice-calc.desktop

sed -i '/Name=/d' ./libreoffice-impress.desktop
sed -i '/GenericName=/d' ./libreoffice-impress.desktop
sed -i "24iName= LibreOffice Impress" libreoffice-impress.desktop
sed -i "25iGenericName=Presentation" libreoffice-impress.desktop

sed -i '/Name=/d' ./libreoffice-draw.desktop
sed -i '/GenericName=/d' ./libreoffice-draw.desktop
sed -i "24iName= LibreOffice Draw" libreoffice-draw.desktop
sed -i "25iGenericName=Drawing Program" libreoffice-draw.desktop

sed -i '/Name=/d' ./libreoffice-base.desktop
sed -i '/GenericName=/d' ./libreoffice-base.desktop
sed -i "24iName= LibreOffice Base" libreoffice-base.desktop
sed -i "25iGenericName=Database" libreoffice-base.desktop

sed -i '/Name=/d' ./libreoffice-math.desktop
sed -i '/GenericName=/d' ./libreoffice-math.desktop
sed -i "24iName= LibreOffice Math" libreoffice-math.desktop
sed -i "25iGenericName=Formula Editor" libreoffice-math.desktop

sed -i '/Name=/d' ./jupyter-lab.desktop
sed -i '/GenericName=/d' ./jupyter-lab.desktop
sed -i "4iName= Jupyter Lab" jupyter-lab.desktop
sed -i "5iGenericName=Python IDE" jupyter-lab.desktop

sed -i '/Name=/d' ./jupyter-notebook.desktop
sed -i '/GenericName=/d' ./jupyter-notebook.desktop
sed -i "4iName= Jupyter Notebook" jupyter-notebook.desktop
sed -i "5iGenericName=Python Notebook" jupyter-notebook.desktop

sed -i '/Name=/d' ./jupyter-nbclassic.desktop
sed -i '/GenericName=/d' ./jupyter-nbclassic.desktop
sed -i "4iName= Jupyter Notebook Classic" jupyter-nbclassic.desktop
sed -i "5iGenericName=Python Notebook" jupyter-nbclassic.desktop

sed -i '/Name=/d' ./remarkable.desktop
sed -i '/GenericName=/d' ./remarkable.desktop
sed -i "4iName= rMview" remarkable.desktop
sed -i "5iGenericName=ReMarkable Screen Share" remarkable.desktop

sed -i '/Name=/d' ./mathpix-snipping-tool.desktop
sed -i '/GenericName=/d' ./mathpix-snipping-tool.desktop
sed -i "4iName= Math Snip" mathpix-snipping-tool.desktop
sed -i "5iGenericName=TeX Generator" mathpix-snipping-tool.desktop

sed -i '/Name=/d' ./freecad_conda.desktop
sed -i '/GenericName=/d' ./freecad_conda.desktop
sed -i "4iName= FreeCAD" freecad_conda.desktop
sed -i "5iGenericName=3D Modeler" freecad_conda.desktop

sed -i '/Name=/d' ./eagle.desktop
sed -i '/GenericName=/d' ./eagle.desktop
sed -i "4iName= Eagle CAD" eagle.desktop
sed -i "5iGenericName=ECAD Suite" eagle.desktop

sed -i '/Name=/d' ./circuitjs.desktop
sed -i '/GenericName=/d' ./circuitjs.desktop
sed -i "4iName= Falstad" circuitjs.desktop
sed -i "5iGenericName=Circuit Simulator" circuitjs.desktop

sed -i '/Name=/d' ./openboardview.desktop
sed -i '/GenericName=/d' ./openboardview.desktop
sed -i "4iName= Open Board Viewer" openboardview.desktop
sed -i "5iGenericName=PCB Viewer" openboardview.desktop

sed -i '/Name=/d' ./kicad.desktop
sed -i '/GenericName=/d' ./kicad.desktop
sed -i "4iName= KiCAD" kicad.desktop
sed -i "5iGenericName=FOSS ECAD Suite" kicad.desktop

sed -i '/Name=/d' ./org.kicad.kicad.desktop
sed -i '/GenericName=/d' ./org.kicad.kicad.desktop
sed -i "4iName= KiCAD" org.kicad.kicad.desktop
sed -i "5iGenericName=FOSS ECAD Suite" org.kicad.kicad.desktop

sed -i '/Name=/d' ./com.ultimaker.cura.desktop
sed -i '/GenericName=/d' ./com.ultimaker.cura.desktop
sed -i "4iName= Cura" com.ultimaker.cura.desktop
sed -i "5iGenericName=3D Print Slicer" com.ultimaker.cura.desktop

sed -i '/Name=/d' ./org.gnome.DiskUtility.desktop
sed -i '/GenericName=/d' ./org.gnome.DiskUtility.desktop
sed -i "4iName= Disks" org.gnome.DiskUtility.desktop
sed -i "5iGenericName=Gnome Ulitity" org.gnome.DiskUtility.desktop

sed -i '/Name=/d' ./gparted.desktop
sed -i '/GenericName=/d' ./gparted.desktop
sed -i "4iName= Gparted" gparted.desktop
sed -i "5iGenericName=Partition Editor" gparted.desktop

sed -i '/Name=/d' ./nm-connection-editor.desktop
sed -i '/GenericName=/d' ./nm-connection-editor.desktop
sed -i "4iName= Network Manager" nm-connection-editor.desktop
sed -i "5iGenericName=Connection Editor" gparted.desktop

sed -i '/Name=/d' ./org.gnome.ColorProfileViewer.desktop
sed -i '/GenericName=/d' ./org.gnome.ColorProfileViewer.desktop
sed -i "4iName= Display Color Profiles" org.gnome.ColorProfileViewer.desktop
sed -i "5iGenericName=Gnome Ulitity" org.gnome.ColorProfileViewer.desktop

sed -i '/Name=/d' ./opentrack.desktop
sed -i '/GenericName=/d' ./opentrack.desktop
sed -i "4iName= Opentrack" opentrack.desktop
sed -i "5iGenericName=3D Face Tracking API" opentrack.desktop

sed -i '/Name=/d' ./openrocket.desktop
sed -i '/GenericName=/d' ./openrocket.desktop
sed -i "4iName= Open Rocket" openrocket.desktop
sed -i "5iGenericName=Rocket Design and Simulation" openrocket.desktop

sed -i '/Name=/d' ./root.desktop
sed -i '/GenericName=/d' ./root.desktop
sed -i "4iName=	√ ROOT" root.desktop
sed -i "5iGenericName=CERN C++ Data Framework" root.desktop

sed -i '/Name=/d' ./webex.desktop
sed -i '/GenericName=/d' ./webex.desktop
sed -i "4iName= Webex" webex.desktop
sed -i "5iGenericName=Video Conferencing" webex.desktop

sed -i '/Name=/d' ./PrusaSlicer.desktop
sed -i '/GenericName=/d' ./PrusaSlicer.desktop
sed -i "4iName= Prusa Slicer" PrusaSlicer.desktop
sed -i "5iGenericName=3D Printing Software" PrusaSlicer.desktop

sed -i '/Name=/d' ./PrusaGcodeviewer.desktop
sed -i '/GenericName=/d' ./PrusaGcodeviewer.desktop
sed -i "4iName= Prusa Gcode Viewer" PrusaGcodeviewer.desktop
sed -i "5iGenericName=Gcode Viewer" PrusaGcodeviewer.desktop

sed -i '/Name=/d' ./pronterface.desktop
sed -i '/GenericName=/d' ./pronterface.desktop
sed -i "4iName= Pronterface" pronterface.desktop
sed -i "5iGenericName=3D Printer Interface" pronterface.desktop

sed -i '/Name=/d' ./pronsole.desktop
sed -i '/GenericName=/d' ./pronsole.desktop
sed -i "4iName= Pronsole" pronsole.desktop
sed -i "5iGenericName=3D Printer Console" pronsole.desktop

sed -i '/Name=/d' ./plater.desktop
sed -i '/GenericName=/d' ./plater.desktop
sed -i "4iName= Plater" plater.desktop
sed -i "5iGenericName=3D Printer Utility" plater.desktop

sed -i '/Name=/d' ./protonup-qt.desktop
sed -i '/GenericName=/d' ./protonup-qt.desktop
sed -i "4iName= Pronton Up" protonup-qt.desktop
sed -i "5iGenericName=GUI Proton Manager" protonup-qt.desktop

sed -i '/Name=/d' ./winetricks.desktop
sed -i '/GenericName=/d' ./winetricks.desktop
sed -i "4iName= Winetricks" winetricks.desktop
sed -i "5iGenericName=Wine Helper Script" winetricks.desktop



# sed -i '/Name=/d' ./.desktop
# sed -i '/GenericName=/d' ./.desktop
# sed -i "4iName= Eagle CAD" .desktop
# sed -i "5iGenericName=PCB Modeler" .desktop

exit
