#!/bin/bash
# downloads a zip of the rM format file
# converts to pdf, and removes the zip

rmapi get $1
NAME=${1#*/}
python -m rmrl ${NAME}.zip ${NAME}.pdf
rm ${NAME}.zip
