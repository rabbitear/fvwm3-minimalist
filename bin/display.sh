#!/usr/bin/bash

if [[ $(hostname) == "buzzy" ]]
then
    xrandr --output HDMI-1 --mode 1280x1024 --rate 75.02
fi

## buzzy's USB-C port seems to come up as DP-2
#if [[ $(hostname) == "buzzy" ]]
#then
#    if xrandr | grep "DP-2 connected"
#    then
#        xrandr --output DP-2 --rotate normal --primary
#    fi
#fi
#
## For the 42 inch on the way, this is a good resolution size.
#if xrandr | grep "HDMI-1 connected"
#then
#    xrandr --output HDMI-1 --mode 1280x720
#fi 
#
#if xrandr | grep "DP-1 connected"
#then
#    xrandr --output DP-1 --mode 1280x1024 --below HDMI-1
#fi

# Take out a lot of the blue color.
xgamma -bgamma 0.3
# Don't blank out the screen after time.
#xset s noblank
#xset s off
#xset dpms 600 900 0

# another machine
#xrandr --output DSI-1 --off --output DP-1 --mode 1600x900 --primary

