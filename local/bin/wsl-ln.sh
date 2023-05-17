#!/usr/bin/env bash

# The dev mode in Windows need to be activated.

if [[ "$1" != "-s" ]]; then
    echo "Usage: wsl-ln -s {{TARGET}} {{LINK_NAME}}"
    exit 1
fi

if [[ -d "$2" ]]; then
    ARG="/d"
elif [[ -f "$2" ]]; then
    ARG=""
else
    echo "Error: $2 is neither a file nor a directory"
    exit 1
fi

TARGET=$(wslpath -w "$(readlink -f "$2")")
LINK_NAME=$(wslpath -w "$(readlink -f "$3")")

cmd.exe /c mklink "$LINK_NAME" "$TARGET"
