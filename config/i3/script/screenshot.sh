#!/usr/bin/bash

# ajouter support des clipboard screenshots : https://gist.github.com/dianjuar/ee774561a8bc02b077989bc17424a19f

# Dependences: imagemagick, xdg-user-dir, xdotool

# settings
FILEPATH="$(xdg-user-dir PICTURES)/screenshot"
FILENAME="$FILEPATH/$(date '+%Y_%m_%d_%H_%M_%S').png"

# screenshot folder
mkdir -p "$FILEPATH"

# take screenshot
case $1 in
    --area)
        import $FILENAME
        ;;
    --screen)
        import -window root $FILENAME
        ;;
    --window)
        import -window "$(xdotool getactivewindow)" $FILENAME
        ;;
    *)
        echo "Usage: ./screenshot [--area|--screen|--window]"
        exit 1
        ;;
esac
