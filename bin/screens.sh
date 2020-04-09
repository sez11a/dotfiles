#!/bin/sh

DIALOG=whiptail
say "Which video chip are you using?"
Vchip=$($DIALOG --radiolist "Which video chip?" 20 60 12 \
    "n" "NVidia"  on \
    "i" "Intel"      off 2>&1 >/dev/tty)

if echo "$Vchip" | grep -iq "^n" ;then
    echo "NVidia"
	xrandr --output eDP-1-1 --auto --output HDMI-1-1 --auto --panning 3840x2160+3840+0 --scale 2x2 --right-of eDP-1-1
else
    echo "Intel"
	xrandr --output eDP-1 --auto --output HDMI-1 --auto --panning 3840x2160+3840+0 --scale 2x2 --right-of eDP-1
	xrandr --output eDP-1 --scale 0.9999x0.9999
fi
