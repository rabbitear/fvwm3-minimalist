#!/usr/bin/bash
if [[ $(hostname) == "buzzy" ]]
then
    xrandr --output DP-2 --rotate normal
fi

#xrandr --output DSI-1 --off --output DP-1 --mode 1600x900 --primary

## For the trackpoint
#xinput set-prop 13 299 0, 0, 1


