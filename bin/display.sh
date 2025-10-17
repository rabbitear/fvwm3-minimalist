#!/usr/bin/env bash
#xrandr --output DSI-1 --off --output DP-1 --mode 1600x900 --primary

## For the trackpoint
#xinput set-prop 13 299 0, 0, 1

xrandr --output "DisplayPort-0" --rotate left

xinput set-prop "USB-HID Keyboard Mouse" "libinput Accel Speed" -0.2
xinput set-prop "USB-HID Keyboard Mouse" "libinput Accel Profile Enabled" 0, 0, 1
