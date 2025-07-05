#!/usr/bin/bash
# buzzy's USB-C port seems to come up as DP-2


# If HDMI is plugged in make it 1280x720 for myself with glasses
# created a dangling elif, but I'll sort this out soon.
if [[ $(hostname) == "buzzy" ]]
then
    if xrandr | grep "DP-2 connected"
    then
        xrandr --output DP-2 --rotate normal --primary
    fi
fi

if xrandr | grep "HDMI-1 connected"
then
    xrandr --output HDMI-1 --mode 1280x720
fi 

xgamma -bgamma 0.3

# another machine
#xrandr --output DSI-1 --off --output DP-1 --mode 1600x900 --primary

## For the trackpoint
#xinput set-prop 13 299 0, 0, 1


