#!/bin/bash

monitors=$(xrandr --query | grep " connected " | cut -f1 -d' ')

monitor1="$(echo $monitors | cut -f1 -d' ')"    # intern
monitor2="$(echo $monitors | cut -f2 -d' ')"    # extern

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
