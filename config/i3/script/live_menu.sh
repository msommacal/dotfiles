#!/usr/bin/env bash

DATAFILE="$1"

STREAMLINK="$HOME/.local/bin/streamlink"
VLC="/usr/bin/cvlc"
WEBBROWSER="/usr/bin/firefox"

function default() {
    $STREAMLINK $1 best >/dev/null &
}

function cast() {
    $VLC $1 >/dev/null &
}

function twitch() {
    $STREAMLINK $1 best >/dev/null &
    firefox --new-window https://www.twitch.tv/popout/${1:22:15}chat?popout=
}

if [ -z "$2" ]; then
    while IFS=";" read -r label url; do
        echo $label
    done < <(tail -n +2 $DATAFILE)
else
    while IFS=";" read -r label url; do
        if [ "$2" == "$label" ]; then
            if [[ $(type -t $(basename $1 .csv)) == function ]]; then
                $(basename $1 .csv) $url
            else
                default $url
            fi
        fi
    done < <(tail -n +2 $DATAFILE)
fi
