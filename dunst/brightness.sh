#!/bin/bash

# Set the path to your custom icon (update if needed)
ICON_PATH="$HOME/.config/dunst/icons/sun-solid.svg"

# Get brightness percentage (clamped between 0 and 100)
get_brightness() {
    brightnessctl get | awk -v max=$(brightnessctl max) '{print int(($1 / max) * 100)}'
}

# Send notification with brightness bar
send_notification() {
    brightness=$(get_brightness)

    # Define bar length
    bar_length=20
    filled_length=$(( (brightness * bar_length) / 100 ))

    # Ensure filled_length does not exceed bar_length
    if [ "$filled_length" -gt "$bar_length" ]; then
        filled_length=$bar_length
    fi

    # Create the brightness bar (fully filled when 100%)
    bar=$(printf "%0.s━" $(seq 1 $filled_length))
    empty=$(printf "%0.s " $(seq 1 $((bar_length - filled_length))))  # Empty part removed at 100%

    dunstify -i "$ICON_PATH" -r 8888 "Brightness: $brightness%" "$bar$empty"
}

# Adjust brightness based on the first argument
case "$1" in
    up)
        brightnessctl set +5% && send_notification
        ;;
    down)
        brightnessctl set 5%- && send_notification
        ;;
    *)
        echo "Usage: $0 {up|down}"
        exit 1
        ;;
esac

