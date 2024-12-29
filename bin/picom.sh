#!/usr/bin/env bash

echo "Starting picom..." >> ~/.fvwm/fvwm3-output.log
picom --daemon --config $HOME/.fvwm/picom.conf 
echo "picom ret: $?" >> ~/.fvwm/fvwm3-output.log

