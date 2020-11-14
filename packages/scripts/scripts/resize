#!/bin/sh
set -x

grid=1:1:0:0:1:1

for i in "$@"; do
    case "$i" in
        -g=*|--grid=*)
            grid="${i#*=}"
            shift ;;
        -a|--all)
            move_all=1
            shift ;;
        *) ;;
    esac
done

if [ -z $move_all ]; then
    yabai -m window --grid "$grid"
else
    current_app=$(yabai -m query --windows --window | jq '.app')
    target_window_ids=$(yabai -m query --windows \
        | jq --arg app "$current_app" '
            map(select(.app == ($app | fromjson)))
            | reverse
            | .[].id
        ')

    echo "$target_window_ids" | tr ' ' '\n' | while read id; do
        yabai -m window "$id" --grid "$grid"
    done
fi
