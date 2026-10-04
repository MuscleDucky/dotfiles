#!/usr/bin/env bash

while true; do
    text=$(playerctl metadata --format '{{title}} - {{artist}}' 2>/dev/null)

    [ -z "$text" ] && {
        echo ""
        sleep 1
        continue
    }

    # Add spacing so the text doesn't run directly into itself
    text="  $text     "
    looped="$text$text"
    # Scroll continuously
    for ((i=0; i<${#text}; i++)); do
        echo "${looped:i:40}"
        sleep 0.15
    done
done
