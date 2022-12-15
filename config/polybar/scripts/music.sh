#!/usr/bin/env bash

if [[ "$(playerctl status 2> /dev/null)" == "Playing" ]]; then
    playerctl metadata --format "{{artist}} - {{title}}"
else
    echo ""
fi
