#!/bin/bash
# move scripts to bin and rename them to remove .sh and .py

cd "${0%/*}"
cd ../scripts
for f in *.sh; do
        NAME=${f::-3}
        sudo cp -p $f /bin/$NAME
done

for f in *.py; do
        NAME=${f::-3}
        sudo cp -p $f /bin/$NAME
done

