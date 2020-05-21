These are my dotfiles and scripts for my workstation/server and my personal laptop. My process for a fresh install is: 
1) boot from a live .iso
2) connect to the internet (wired or via the `wifi-menu` command)
3) install git with: `pacman -Syy && pacman -S git`
4) clone the repository: `git clone https://github.com/deionizedoatmeal/archdots.git`
5) run the script `./archdots/install-scripts/arch-install-1.sh`, and follow the prompts
6) after the first script chroots to the new system, run the second script `./archdots/install-scripts/arch-install-2.sh`, follow the prompts and then manually check everything once it finishes
6) `exit` and `reboot` the system
7) enter the disk encryption password, then log into the tty
8) make sure the network interfaces are up, move to the install-scripts directoy, run `./software-install.sh` and `./placement.sh`
9) set my intial wallpaper and colorschemes `wal -i ~/Repos/archdots/blurrr.jpg`
10) securely import ssh and gpg keys and run `./pass-setup.sh`
11) reboot and log into [i3](https://github.com/resloved/i3) via [ly](https://github.com/cylgom/ly)
12) import data, log into applications (messages, spotify, firefox, and steam)

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
- installing archlinux with sane* defaults, and a LVM on LUKS encryption scheme
- installing pacman, aur, github, python and rust packages
- installing a fork of i3-gaps with rounded window borders
- installing polybar
- installing fonts, cloning repos and doing some housekeeping
- moving config files and scripts into neccesary locations 
* acording to me lol
# functionality scripts:  
- system status, resource usage and monitoring
- wrapper for launching and kill spotifyd and spotify-tui simulataneously
- volume adjustment w/ notification
- backlight adjustment w/ notification
- simple lock screen
- toggling dpsm (screen saver display power off power saving thingy)
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
# screenshots
![Rofi](/screenshots/rofi.png)
![Scripting](/screenshots/scripting.png)
![Texting](/screenshots/messages.png)
![Studying](/screenshots/studying.png)
![Memories](/screenshots/scrapbook.png)
![Music](/screenshots/music.png)
![Ranger](/screenshots/ranger.png)
![Kitty](/screenshots/sisters.png)
![Lock](/screenshots/gllock.png)
