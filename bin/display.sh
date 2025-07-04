#!/usr/bin/bash
# buzzy's USB-C port seems to come up as DP-2
if [[ $(hostname) == "buzzy" ]]
then
    xrandr --output DP-2 --rotate normal
    xrandr --output DP-2 --primary
fi
xgamma -bgamma 0.3


#xrandr --output DSI-1 --off --output DP-1 --mode 1600x900 --primary

## For the trackpoint
#xinput set-prop 13 299 0, 0, 1


