#!/bin/bash

monitor1="eDP-1"    # intern
monitor2="HDMI-1"   # extern

function menu() {
    printf "intern\nextern\nmirror\nexpand"
}

MENU=$( menu | rofi -dmenu -p "display")

case $MENU in
    intern)
        xrandr --output $monitor2 --off --output $monitor1 --auto
        ;;
    extern)
        xrandr --output $monitor1 --off --output $monitor2 --auto
        ;;
    mirror)
        xrandr --output $monitor1 --auto --output $monitor2 --auto && xrandr --output $monitor1 --auto --output $monitor2 --same-as $monitor1
        ;;
    expand)
        xrandr --output $monitor1 --auto --output $monitor2 --auto && xrandr --output $monitor2 --auto --right-of $monitor1
        wal -R
        # ~/.config/fehbg
        ;;
esac
