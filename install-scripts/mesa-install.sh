#!/bin/bash

# download and decompress SDK
wget --user-agent="" http://www.astro.wisc.edu/~townsend/resource/download/mesasdk/mesasdk-x86_64-linux-20.3.2.tar.gz
tar xvfz mesasdk-x86_64-linux-20.3.2.tar.gz -C ~/Repos/.

# set path for SDK in bash
#init-mesa

# download and decompress mesa
wget --user-agent="" https://sourceforge.net/projects/mesa/files/releases/mesa-r12778.zip/download
unzip mesa-r*.zip

rm mesa-r*.zip
mv mesa-r* ~/Repos/.

cd ~/Repos/mesa-r*/
./install
