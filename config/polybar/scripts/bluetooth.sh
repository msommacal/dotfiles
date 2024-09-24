#!/usr/bin/env bash

function bluetooth_status {
    if [ "$(systemctl is-active "bluetooth.service")" = "active" ]; then
        echo "$(bluetoothctl devices Connected | cut -d ' ' -f3-)"
    else
        echo ""
    fi
}

function bluetooth_toggle {
    if bluetoothctl show | grep -q "Powered: no"; then
        bluetoothctl power on >> /dev/null
        
        for d in $(bluetoothctl devices Paired | cut -d ' ' -f2); do
            bluetoothctl connect "$d" >> /dev/null
        done
    else
        for d in $(bluetoothctl devices Paired | cut -d ' ' -f2); do
            bluetoothctl disconnect "$d" >> /dev/null
        done

        bluetoothctl power off >> /dev/null
    fi
}

case "$1" in
    --toggle)
        bluetooth_toggle
        ;;
    *)
        bluetooth_status
        ;;
esac
