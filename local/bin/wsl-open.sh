#!/usr/bin/env bash

# Convert WSL path to Windows path
function convert_path() {
    ARG=$(readlink -f "$1")

    if [[ $ARG = "/mnt"* ]]; then
        ARG=$(tr '[:lower:]' '[:upper:]' <<< "${ARG:5:1}"):${ARG:6}
    else
        ARG="\\\\wsl.localhost\\Ubuntu"${ARG//\//\\}
    fi
}

# Check the type of argument
if [ -f "$1" ] || [ -d "$1" ]; then
    convert_path "$1"
elif [[ $1 = "https:"* ]] || [[ $1 = "http:"* ]] || [[ $1 = "www."* ]]; then 
    ARG=$1
else
    echo "Usage: wsl-open {{directory|file|url}}"
    exit 1
fi

powershell.exe -Command Start-Process "'$ARG'"
