#!/bin/bash

HOST=0.0.0.0
PORT=5000

[[ -f /etc/conf.d/octoprint ]] && . /etc/conf.d/octoprint

exec /usr/lib/octoprint/bin/octoprint serve --host $HOST --port $PORT
