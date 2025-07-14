#!/usr/bin/env bash

FILENAME=~/Pictures/$(date +"ss-%s").png
maim -s $FILENAME 
# | xclip -selection clipboard -t image/png
sync
sleep 0.5
notify-send --icon=$FILENAME "Screenshot taken as $FILENAME"

TERMINALS="xterm urxvt rxvt eterm"
# Do we have Xorg?
if [[ -n $DISPLAY ]]
then
    for term in $TERMINALS; do
        if type "$term" >/dev/null 2>&1; then
            USE_TERM="$term"
            break
        fi
    done
fi

# If we have a terminal to use
if [[ -n $USE_TERM ]]
then
    $USE_TERM -name Note \
    -fn "9x15bold,xft:Bitstream Vera Sans Mono:size=13" \
    -g 74x8
fi

