#!/bin/bash
# drops my ssh configs where they need to be and starts the systemd services

# move the the directory the script is in
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd $DIR

# copy configs
sudo cp ${HOME}/Secrets/ssh/sshd_config /etc/ssh/sshd_config

# copy io and triton keys to autorized keys
touch ${HOME}/.ssh/authorized_keys
cat ${HOME}/Secrets/keys/io1.pub >> ${HOME}/.ssh/authorized_keys
cat ${HOME}/Secrets/keys/triton1.pub >> ${HOME}/.ssh/authorized_keys

# enable service
sudo systemctl enable sshd
sudo systemctl start sshd
