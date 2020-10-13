#!/bin/sh

userresources=$HOME/.xresources

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

to_export=(DISPLAY XAUTHORITY PATH)

systemctl --user import-environment "${to_export[@]}"
dbus-update-activation-environment "${to_export[@]}"

exec i3
