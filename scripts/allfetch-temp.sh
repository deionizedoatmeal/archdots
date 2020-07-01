#!/bin/bash
# modifed from https://gitlab.com/jennydaman/PigeonStats, all credit to them

disk="/dev/sda /dev/sdb /dev/sdc /dev/sdd"
clear=$(tput sgr0)

printf "%s\n" "$(tput bold)Hardware Temperatures$clear"



function tcolor () {
  if [ "$1" -ge "$2" ]; then
    color=$(tput setab 196)
  elif [ "$1" -ge "$3" ]; then
    color=$(tput setab 3)
  elif [ "$1" -ge "$4" ]; then
    color=$(tput setab 2)
  else
    color=$(tput setab 6)
  fi
}

temp=$(sudo hddtemp $disk 2>&1)
if [[ "$temp" = *"sleeping"* ]] && [[ "$@" != *"wake"* ]]; then
  printf "\n%s\n" "$temp"
else
  temp=$(sudo hddtemp -qnw $disk)
  celcius="°C"
  tcolor $temp 50 40 25
  printf "\n%1s" " $color $disk $temp$celcius $clear" 
  if [[ "$@" == *"--oneline"* ]]; then
    printf " "
  else
    printf "\n\n"
  fi
fi

NVME1T=$(sudo nvme smart-log /dev/nvme0n1 | grep temperature | cut -d \: -f2)
NVME1N=$(sudo nvme id-ctrl /dev/nvme0n1 | grep -w mn | cut -d \: -f2)
echo "/dev/nvme0n1:" $NVME1N ":" $NVME1T


cpu_temps=""
col=0
sensors_output=$(sensors -uA 2> /dev/null)


while read -r core_name; do

  temp=$(printf "$sensors_output" | grep -A1 "$core_name" | awk '{if(/_input:/) print $2}')
  temp=$(printf "%.1f" "$temp")
  tcolor $(echo $temp | cut -f1 -d".") 70 60 25
  cpu_temps="${cpu_temps} $color CORE $(echo $core_name | tr -dc '0-9') $temp$celcius $clear "

  # print four cores per row
  ((col++))
  if [ "$col" -ge "6" ]; then
    printf "\n%s\n" "${cpu_temps}"
    cpu_temps=""
  fi
done <<< $(printf "$sensors_output" | grep Core)

[ -n "$cpu_temps" ] && printf "%s\n" "${cpu_temps}"




