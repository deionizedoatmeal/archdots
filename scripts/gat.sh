#!/bin/bash
# cat and grep combined

cat $1 | grep -in -A 1 -B 1 $2 --color
