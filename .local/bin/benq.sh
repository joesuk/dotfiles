#!/bin/sh
TOGGLE=$HOME/.config/.toggle_s
if [ ! -e $TOGGLE ]; then
    touch $TOGGLE
    xrandr --output eDP-1 --primary --mode 2256x1504 --pos 2880x0 --rotate normal --output DP-1 --mode 1920x1080 --pos 0x0 --rotate normal --scale 1.5x1.5 --output DP-2 --off --output DP-3 --off --output DP-4 --off &
	setbg && notify-send "2nd monitor enabled"
else
    rm $TOGGLE
    xrandr --output eDP-1 --primary --mode 2256x1504 --pos 0x0 --rotate normal --output DP-1 --off --output DP-2 --off --output DP-3 --off --output DP-4 --off &
    setbg && notify-send "2nd monitor disabled"
fi
#xrandr --output eDP-1 --primary --mode 2256x1504 --pos 2880x0 --rotate normal --output DP-1 --mode 1920x1080 --pos 0x0 --rotate normal --scale 1.5x1.5 --output DP-2 --off --output DP-3 --off --output DP-4 --off &
#setbg
