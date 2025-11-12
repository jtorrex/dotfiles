#!/bin/bash
# Launch ChatGPT in Firefox as a floating window
firefox --new-window https://chatgpt.com & sleep 2 && swaymsg "[app_id=\"firefox\" title=\".*ChatGPT.*\"] floating enable"
