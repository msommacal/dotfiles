#!/bin/bash

function menu() {
    printf "power off\nreboot\nlock\nlogout"
}

MENU=$( menu | rofi -dmenu -p "power")

case $MENU in
    "logout")
        i3-msg exit
        ;;
    "lock")
        $HOME/.config/i3/script/lock.sh
        ;;
    "power off")
        poweroff
        ;;
    "reboot")
        reboot
        ;;
esac
