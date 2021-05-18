#!/bin/bash
IFS=$'\t'
pacman -Qi | grep -P "^(Name|Install Date)" | sed -r ":a;N;s/Name\s+: (.*)\nInstall Date\s+: (.*)/\2\t\1/" | while read pkg_date pkg_name; do echo -e $(date +%F\ %T --date="$pkg_date") '\t' $pkg_name; done | sort
