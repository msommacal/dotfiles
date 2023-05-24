#!/usr/bin/env bash

DATADIR="$HOME/.local/share/live/"

modi=$(for i in $DATADIR/*; do echo -n "$(basename $i .csv):$HOME/.config/i3/script/live_menu.sh $i,"; done)
show="tv"

rofi -modi "$modi" -show $show
