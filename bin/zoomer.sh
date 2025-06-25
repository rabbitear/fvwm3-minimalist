#!/usr/bin/env bash
#mpv --quiet $HOME/.fvwm/zoom-sound.ogg &
#notify-send --expire-time=2000 "boomer on"
if [[ -n "$(pidof boomer)" ]]; then
    kill $(pidof boomer)
    exit 1
else
    mpv --quiet $HOME/.fvwm/sounds/left-round-bracket
    ( sleep 0.2; xdotool click 5 ) &
    $HOME/.local/bin/boomer

    notify-send --expire-time=550 " --+- boomer off -+-- "
    mpv --quiet $HOME/.fvwm/sounds/right-round-bracket
fi
