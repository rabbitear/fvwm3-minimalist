#!/usr/bin/env bash

FILENAME=~/Pictures/$(date +"ss-%s").png
maim -s $FILENAME 
# | xclip -selection clipboard -t image/png
sync
sleep 0.5
notify-send --icon=$FILENAME "Screenshot taken as $FILENAME"

