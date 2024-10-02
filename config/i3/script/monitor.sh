#!/usr/bin/env bash

monitor1="$(xrandr -q | grep -w connected | awk 'NR==1 {print $1}')" # intern
monitor2="$(xrandr -q | grep -w connected | awk 'NR==2 {print $1}')" # extern

function menu() {
    printf "intern ($monitor1)\nextern ($monitor2)\nmirror\nexpand"
}

MENU=$( menu | rofi -dmenu -p "display")

case $MENU in
    intern*)
        xrandr --output $monitor2 --off --output $monitor1 --auto
        ;;
    extern*)
        xrandr --output $monitor1 --off --output $monitor2 --auto
        ;;
    mirror)
        xrandr --output $monitor1 --auto --output $monitor2 --auto && xrandr --output $monitor1 --auto --output $monitor2 --same-as $monitor1
        ;;
    expand)
        xrandr --output $monitor1 --auto --output $monitor2 --auto && xrandr --output $monitor2 --auto --right-of $monitor1
        ;;
esac
