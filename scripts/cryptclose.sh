#!/bin/bash

sudo umount /dev/mapper/${1}
sudo cryptsetup close ${1}
