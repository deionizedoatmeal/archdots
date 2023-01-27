#!/bin/bash

sudo pacman -Sy archlinux-keyring
sudo pacman-key --populate archlinux
sudo pacman-key --refresh-keys
sudo pacman -Syu
