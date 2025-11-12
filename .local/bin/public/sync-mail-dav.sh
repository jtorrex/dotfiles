#!/bin/bash

# Execute mail sync
mbsync -c ~/.config/mbsync/mbsyncrc -aq

# Index new mail with notmuch
notmuch new

# Execute DAV sync
vdirsyncer sync
vdirsyncer metasync

notify-send "Synced mail"
