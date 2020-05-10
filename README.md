These are my dotfiles and scripts for my workstation/server and my personal laptop. My process for a fresh install is: 
1) boot from a live .iso
2) connect to the internet (wired or via the `wifi-menu` command)
3) install git with: `pacman -Syy && pacman -S git`
4) clone the repository: `git clone https://github.com/deionizedoatmeal/dots.git`
5) run the script `./dots/install-scripts/arch-install.sh`, follow the prompts and then manually check everything once it finishes
6) `exit` and `reboot` the system
7) enter the disk encryption password, then log into tty
8) run `./software-install.sh` and `./placement.sh`
8) securely import ssh and gpg keys and run `./pass-setup.sh`
9) reboot and log into [i3](https://github.com/resloved/i3) via [ly](https://github.com/cylgom/ly)
10) import my data, log into applications (messages, spotify, firefox, and steam)

# configuation files for:
- [i3-gaps-rounded](https://github.com/resloved/i3) (Ben Friesen's fork of the infamous tiling window manager)
- [polybar](https://github.com/polybar/polybar) (desktop status bar)
- [Bernd Busse's (aka tryonne144) fork of compton](https://github.com/tryone144/compton) (a graphical compositor)
- [kitty](https://github.com/kovidgoyal/kitty) (terminal emulator)
- [rofi](https://github.com/davatorium/rofi) (highly customizable application launcher)
- [dunst](https://github.com/dunst-project/dunst) (notification serivce)
- firefox (web browser)
- neovim (text editor)
- [ranger](https://github.com/ranger/ranger) (TUI file browser)
- [zathura](https://github.com/pwmt/zathura) (PDF reader)
- [spotify-tui](https://github.com/Rigellute/spotify-tui) + [spotifyd](https://github.com/Spotifyd/spotifyd) (TUI version of the spotify streaming client)
- [ly](https://github.com/cylgom/ly) (display manager)
- grub, mkinitcpio and sudo (specific configs needed for encryption and of my scripts)
# installation scripts:  
- installing archlinux with sane defaults, and a LVM on LUKS encryption scheme
- installing pacman, aur, github, python and rust packages
- installing ben friesen's fork of i3-gaps  
- installing polybar
- installing fonts, cloning repos and doing some housekeeping
- moving config files and scripts into neccesary locations 
# functionality scripts:  
- system status, resource usage and monitoring
- wrapper for launching and kill spotifyd and spotify-tui simulataneously
- volume adjustment w/ notification
- backlight adjustment w/ notification
- simple lock screen
- toggle light and dark themes
- a paper mode to be used in conjuction with i3-gaps
- toggle redshift & display redshift status in polybar  
- toggling bluetooth interface and connecting to bluetooth devices
- display cpu frequency in polybar  
- display power useage profile in polybar  
- using rofi to change power usage profile
- using rofi to exit session
- using rofi to connect to bluetooth devices
- using rofi to mannage vpn
- using rofi to connect to wireless networks (comming soon)
- mounting and opening encrypted LUKS drives
- switching between system wide dark and light mode
# screenshots (slightly out of date)
![Clock](/screenshots/2020-02-15-025155_3200x1800_scrot.png)
![Clock](/screenshots/2020-02-15-022234_3200x1800_scrot.png)
![Clock](/screenshots/2020-02-15-025728_3200x1800_scrot.png)
![Clock](/screenshots/2020-02-15-025019_3200x1800_scrot.png)
![Clock](/screenshots/2020-02-15-023947_3200x1800_scrot.png)
![Clock](/screenshots/2020-02-15-023655_3200x1800_scrot.png)
![Clock](/screenshots/2020-02-15-022833_3200x1800_scrot.png)
![Clock](/screenshots/2020-02-15-022749_3200x1800_scrot.png)
![Clock](/screenshots/2020-02-15-022459_3200x1800_scrot.png)
![Clock](/screenshots/2020-02-15-022425_3200x1800_scrot.png)
![Clock](/screenshots/2020-02-15-022341_3200x1800_scrot.png)
