#!/bin/bash
# i've canibalized large parts of this from Zach Baylin's fantastic script which can be found here:
# https://github.com/zbaylin/rofi-wifi-menu
# make sure to check out their script as well
# ian k. bania 
# june '20

# check if there is currently a connection
CONSTATE=$(nmcli -fields WIFI g)

# set the labels to be used later
if [[ "$CONSTATE" =~ "enabled" ]]; then
	TOGGLE=" toggle off"
    ONOFF="on"
elif [[ "$CONSTATE" =~ "disabled" ]]; then
	TOGGLE=" toggle on"
    ONOFF="off"
fi

# make an empty rofi menu while scaning for networks
echo "scaning..." | rofi -dmenu -p "wifi $ONOFF" -lines 1 -width 24 &

# SSID,SECURITY could also be used here
FIELDS=SSID

LIST=$(nmcli --fields "$FIELDS" device wifi list | sed '/^--/d' | sed '/^SSID/d' | sed '/^181/d' | uniq -u)
echo $LIST

# dynamically change the height of the rofi menu
LINENUM=$(echo "$LIST" | wc -l)
((LINENUM=LINENUM + 2))

# gives a list of known connections so we can parse it later
KNOWNCON=$(nmcli connection show)

# find the current name of our network
CURRSSID=$(LANGUAGE=C nmcli -t -f active,ssid dev wifi | awk -F: '$1 ~ /^yes/ {print $2}')

#if [[ ! -z $CURRSSID ]]; then
#	HIGHLINE=$(echo  "$(echo "$LIST" | awk -F "[  ]{2,}" '{print $1}' | grep -Fxn -m 1 "$CURRSSID" | awk -F ":" '{print $1}') + 1" | bc )
#fi

# if there are more than 14 SSIDs, the menu will still only have 14 lines
if [ "$LINENUM" -gt 14 ] && [[ "$CONSTATE" =~ "enabled" ]]; then
	LINENUM=14
elif [[ "$CONSTATE" =~ "disabled" ]]; then
	LINENUM=1
fi

# kill the placeholder
killall rofi

# start the real rofi menu
CHENTRY=$(echo -e "$TOGGLE\nmanual\n$LIST" | rofi -dmenu -p "wifi $ONOFF" -lines "$LINENUM" -width 24)
CHSSID=$(echo "$CHENTRY" | sed  's/\s\{2,\}/\|/g' | awk -F "|" '{print $1}')

# if the user inputs "manual" as their SSID in the start window, it will bring them to this screen
if [ "$CHENTRY" = "manual" ] ; then
	# Manual entry of the SSID and password (if appplicable)
	MSSID=$(echo "enter the SSID of the network (SSID,password)" | rofi -dmenu -p "Manual Entry: " -lines 1)
	# Separating the password from the entered string
	MPASS=$(echo "$MSSID" | awk -F "," '{print $2}')

	# If the user entered a manual password, then use the password nmcli command
	if [ "$MPASS" = "" ]; then
		nmcli dev wifi con "$MSSID"
	else
		nmcli dev wifi con "$MSSID" password "$MPASS"
	fi

elif [ "$CHENTRY" = " toggle on" ]; then
	sudo rfkill unblock wlan

elif [ "$CHENTRY" = " toggle off" ]; then
	sudo rfkill block wlan

else

	# If the connection is already in use, then this will still be able to get the SSID
	if [ "$CHSSID" = "*" ]; then
		CHSSID=$(echo "$CHENTRY" | sed  's/\s\{2,\}/\|/g' | awk -F "|" '{print $3}')
	fi

	# Parses the list of preconfigured connections to see if it already contains the chosen SSID. This speeds up the connection process
	if [[ $(echo "$KNOWNCON" | grep "$CHSSID") = "$CHSSID" ]]; then
		nmcli con up "$CHSSID"
	else
		if [[ "$CHENTRY" =~ "WPA2" ]] || [[ "$CHENTRY" =~ "WEP" ]]; then
			WIFIPASS=$(echo "if connection is stored, hit enter" | rofi -dmenu -p "password: " -lines 1 )
		fi
		nmcli dev wifi con "$CHSSID" password "$WIFIPASS"
	fi

fi

