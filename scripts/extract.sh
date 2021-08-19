#!/bin/sh

export XZ_OPT=-T4

if [ -z "$1" ]; then
    echo "Usage: extract filename"
    echo "Extract a given file based on the extension."
    exit 1
elif [ ! -f "$1" ]; then
    echo "Error: '$1' is not a valid file for extraction"
    exit 1
fi

case "$1" in
    *.tbz2 | *.tar.bz2) tar -xvjf  "$1"     ;;
    *.txz | *.tar.xz)   tar -xvJf  "$1"     ;;
    *.tgz | *.tar.gz)   tar -xvzf  "$1"     ;;
    *.tar | *.cbt)      tar -xvf   "$1"     ;;
    *.tar.zst)          tar -xvf   "$1"     ;;
    *.zip | *.cbz)      unzip      "$1"     ;;
    *.rar | *.cbr)      unrar x    "$1"     ;;
    *.arj)              unarj x    "$1"     ;;
    *.ace)              unace x    "$1"     ;;
    *.bz2)              bunzip2    "$1"     ;;
    *.xz)               unxz       "$1"     ;;
    *.gz)               gunzip     "$1"     ;;
    *.7z)               7z x       "$1"     ;;
    *.Z)                uncompress "$1"     ;;
    *.gpg)        gpg -d "$1" | tar -xvzf - ;;
    *) echo "Error: failed to extract '$1'" ;;
esac
