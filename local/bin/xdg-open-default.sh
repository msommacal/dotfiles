#!/usr/bin/env bash

if [ -f "$1" ]; then
    # Determine the mimetype of a file
    MIMETYPE=$(xdg-mime query filetype "$1")

    # Lists all applications which can manage this type of file
    DESKTOPS=$(grep -l $MIMETYPE /usr/share/applications/*.desktop $HOME/.local/share/applications/*.desktop)

    # Select an app with rofi
    SELECTED=$(printf "%s\n" $DESKTOPS | rofi -dmenu -i -p "$MIMETYPE")

    if [ "$SELECTED" ]; then
        # Modify the program used for xdg-open
        xdg-mime default "$(basename -- $SELECTED)" "$MIMETYPE"
    fi
else
    echo "Usage: xdg-open-default {{file}}"
    exit 1
fi
