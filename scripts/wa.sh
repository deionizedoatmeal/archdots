#!/bin/bash

#  Description
#  -----------
#  <img src="https://developer.run/pic/wa_full.png"/> 
#  <img src="https://developer.run/pic/wa.png"/> 
#  <img src="https://developer.run/pic/wa2.png"/> 
#  
#  Using Wolfram Alpha in command line. See [blog post](http://developer.run/37) for description and more ideas.


#  Author: [Dmitry](http://dmi3.net) [Source](https://github.com/dmi3/bin)
  
#  Requirements
#  ------------
#  * Make sure to configure variables in script
#  * Put [api key](https://products.wolframalpha.com/api/) in `APPID`
#  * For `VIEWER`, you can use text only api and **optionaly** use [terminal that supports images](https://developer.run/40)
#  **or** `sudo apt-get install imagemagick` to view images.
#  * Configure `BG` and `FG` variables depending on color scheme

#  Usage
#  ------------
#      ➤ wa helsinki to dublin plane
#      2 hours 20 minutes                                                                                           
#      ➤ wa time in dublin
#      5:37:57 pm GMT; Friday, January 27, 2017
#      ➤ wa 15.36 english money to eur
#      14.35 euros                                                                                                          
#      ➤ wa days till nov 16
#      293 days
#      ➤ wa 154Mbit/s to MB/s
#      19.2 megabytes per second
#      ➤ wa brick red hex
#      #AB0303 
#      ➤ wa weather in moscow
#      9 degrees Celsius and cloudy, with light winds✖
#      ➤ wa plot x=y^2
#      [...draws plot if supported]
#      ➤ # many many more usages... https://www.wolframalpha.com/examples/


VIEWER="kitty +kitten icat"                             # Use `VIEWER="display"` from imagemagick if terminal does not support images
BG="transparent"                                        # Transparent background
FG="white"                                              # Match color to your terminal
test "$APPID" == "" && echo "\$APPID not set in ${BASH_SOURCE[0]}"

RESPONSE=$(curl -s "https://api.wolframalpha.com/v1/result?appid=$APPID&units=metric&" --data-urlencode "i=$*" | tee /dev/tty)

# Remove next if you are fine with text only api, and don't want to see any images
test "No short answer available" = "$RESPONSE"\
     && echo ", downloading full answer..."\
     && curl -s "https://api.wolframalpha.com/v1/simple?appid=$APPID&units=metric&foreground=$FG&background=$BG" --data-urlencode "i=$*" | $VIEWER || printf "\n" && exit 0

