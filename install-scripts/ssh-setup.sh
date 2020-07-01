#!/bin/bash

# copy configs
sudo cp ${HOME}/Secrets/ssh/sshd_config /etc/ssh/sshd_config

# copy io and triton keys to autorized keys
touch ${HOME}/.ssh/authorized_keys
cat ${HOME}/Secrets/keys/io.pub >> ${HOME}/.ssh/authorized_keys
cat ${HOME}/Secrets/keys/triton.pub >> ${HOME}/.ssh/authorized_keys

# enable service
sudo systemctl enable sshd
sudo systemctl start sshd
