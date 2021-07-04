#!/bin/bash
sudo killall -QUIT openconnect </dev/null &>/dev/null &
sudo killall openconnect </dev/null &>/dev/null &
sudo killall -QUIT vpn-connect-full </dev/null &>/dev/null &
sudo killall vpn-connect-full </dev/null &>/dev/null &
sudo killall -QUIT vpn-connect </dev/null &>/dev/null &
sudo killall vpn-connect </dev/null &>/dev/null &
sudo killall -QUIT vpn-connect-full.exp </dev/null &>/dev/null &
sudo killall vpn-connect-full.exp </dev/null &>/dev/null &
sudo killall -QUIT vpn-connect.exp </dev/null &>/dev/null &
sudo killall vpn-connect.exp </dev/null &>/dev/null &
sudo pkill -SIGINT openconnect </dev/null &>/dev/null &

