#!/usr/bin/env bash

histfile="$HOME/.cache/cliphist"
placeholder="<NEWLINE>"

highlight() {
  # Copy from primary selection to clipboard
  clip=$(wl-paste --no-newline --primary)
  echo -n "$clip" | wl-copy
}

output() {
  # Read from stdin and send to clipboard
  clip=$(cat)
  echo -n "$clip" | wl-copy
}

write() {
  [ -f "$histfile" ] || {
    dunstify -u low "Cliphist" "Creating $histfile"
    touch "$histfile"
  }
  [ -z "$clip" ] && exit 0
  multiline=$(echo "$clip" | sed ':a;N;$!ba;s/\n/'"$placeholder"'/g')
  grep -Fxq "$multiline" "$histfile" || echo "$multiline" >>"$histfile"
  notification="Saved to clipboard history"
}

sel() {
  selection=$(tac "$histfile" | rofi -dmenu -p "Clipboard history:" -theme-str 'window {width: 60%;}')
  if [ -n "$selection" ]; then
    echo "$selection" | sed "s/$placeholder/\n/g" | wl-copy
    notification="Copied to clipboard!"
  fi
}

case "$1" in
add) highlight && write ;;
out) output && write ;;
sel) sel ;;
*)
  printf "$0 | File: $histfile\n\nadd - copies primary selection to clipboard, and adds to history file\nout - pipe commands to copy output to clipboard, and add to history file\nsel - select from history file with rofi and recopy!\n"
  exit 0
  ;;
esac

[ -z "$notification" ] || dunstify -u low "Cliphist" "$notification"
