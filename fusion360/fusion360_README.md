
install yad:
```sudo pacman -S --needed wine wine-mono wine_gecko winetricks p7zip curl yad samba cabextract ppp```

run this command:
```mkdir -p "$HOME/.fusion360/bin" && cd "$HOME/.fusion360/bin" && wget -N https://raw.githubusercontent.com/cryinkfly/Autodesk-Fusion-360-for-Linux/main/files/builds/stable-branch/bin/install.sh && chmod +x install.sh && ./install.sh```

follow defaults in the wizard

put desktop files in `~/.local/share/applications/Programs/Autodesk/Fusion360/default/`
