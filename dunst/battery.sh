#!/bin/bash

USER=$(logname)
DISPLAY=:0
export DISPLAY=:0
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$(id -u $USER)/bus"

# Icons for notifications (change paths if needed)
LOW_BATTERY_ICON="$HOME/.config/dunst/icons/battery-quarter-solid.svg"
FULL_BATTERY_ICON="$HOME/.config/dunst/icons/battery-full-solid.svg"

# Temporary file to store last notification type
STATE_FILE="/tmp/battery_notify_state"

# Get battery percentage and charging status using acpi
BATTERY_INFO=$(acpi -b)
BATTERY_LEVEL=$(echo "$BATTERY_INFO" | grep -oP '\d+%' | tr -d '%')
IS_CHARGING=$(echo "$BATTERY_INFO" | grep -o "Charging")

# Read last state
LAST_STATE=$(cat "$STATE_FILE" 2>/dev/null || echo "none")

# Determine status and send notifications only if status changed
if [ "$BATTERY_LEVEL" -le 20 ] && [ -z "$IS_CHARGING" ] && [ "$LAST_STATE" != "low" ]; then
  dunstify -u critical -i "$LOW_BATTERY_ICON" "Battery Low!" "Connect the charger! ($BATTERY_LEVEL%)"
  echo "low" >"$STATE_FILE"

elif [ "$BATTERY_LEVEL" -ge 100 ] && [ -n "$IS_CHARGING" ] && [ "$LAST_STATE" != "full" ]; then
  dunstify -u normal -i "$FULL_BATTERY_ICON" "Battery Full" "Unplug the charger to avoid overcharging!"
  echo "full" >"$STATE_FILE"

fi
