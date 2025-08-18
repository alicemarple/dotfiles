#!/bin/bash

# Set the path to your custom icon
ICON_PATH="$HOME/.config/dunst/icons/volume-low-solid.svg"

# Get volume percentage (clamped between 0 and 100)
get_volume() {
    pamixer --get-volume | awk '{if ($1 > 100) print 100; else if ($1 < 0) print 0; else print $1}'
}

# Get mute status
is_muted() {
    pamixer --get-mute
}

# Send notification with volume bar
send_notification() {
    volume=$(get_volume)
    muted=$(is_muted)

    # Define bar length
    bar_length=20
    filled_length=$(( (volume * bar_length) / 100 ))

    # Ensure filled_length does not exceed bar_length
    if [ "$filled_length" -gt "$bar_length" ]; then
        filled_length=$bar_length
    fi

    # Create a visual volume bar
    bar=$(printf "%0.s━" $(seq 1 $filled_length))

    if [ "$muted" == "true" ]; then
        dunstify -i "$ICON_PATH" -r 9999 "Volume: Muted"
    else
        dunstify -i "$ICON_PATH" -r 9999 "Volume: $volume%" "$bar"
    fi
}

# Adjust volume based on the first argument
case "$1" in
    up)
        pamixer -i 5 && send_notification
        ;;
    down)
        pamixer -d 5 && send_notification
        ;;
    mute)
        pamixer -t && send_notification
        ;;
    *)
        echo "Usage: $0 {up|down|mute}"
        exit 1
        ;;
esac

