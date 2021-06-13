#!/bin/bash

# sudo openconnect --protocol=gp --user=ibania remoteaccess.colgate.edu
{
sed -e 's/\s*\([\+0-9a-zA-Z]*\).*/\1/' << EOF | sudo openconnect -b --protocol=gp remoteaccess.colgate.edu
ibania
PASSWORD
FullTunnel
EOF
} </dev/null &>/dev/null &
