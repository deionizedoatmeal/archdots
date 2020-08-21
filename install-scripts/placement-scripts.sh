#!/bin/bash
# move scripts to bin and rename them to remove .sh and .py

# don't run as sudo
if [ "$EUID" -eq 0 ]
  then echo "Please do not run as root"
  exit
fi

# move to the directory the script is in
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd $DIR
#cd "${0%/*}"

cd ../scripts
for f in *.sh; do
        NAME=${f::-3}
        sudo cp -p $f /bin/$NAME
done

for f in *.py; do
        NAME=${f::-3}
        sudo cp -p $f /bin/$NAME
done

