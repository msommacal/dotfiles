#!/usr/bin/bash

# Dependences: i3lock, imagemagick

# settings
LOCK_SCREENSHOT=/tmp/lock_screenshot.png
BLUR_SCREENSHOT=/tmp/blur_screenshot.png
BLUR=0x5

# take a screenshot
import -window root $LOCK_SCREENSHOT

# blur the screenshot
convert $LOCK_SCREENSHOT -blur $BLUR $BLUR_SCREENSHOT

# lock the screen
i3lock --show-failed-attempts --image=/tmp/blur_screenshot.png

# delete the screenshot
rm /tmp/blur_screenshot.png
