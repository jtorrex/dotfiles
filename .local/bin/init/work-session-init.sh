#!/bin/zsh

WORK_SESSION="work"

echo "Adding ssh keys..."
ssh-add ~/.ssh/hpcnow-jtorres-key

echo "Starting tmux configuration..."
WORK_SESSIONEXISTS=$(tmux list-sessions | grep $WORK_SESSION)

# Only create tmux session if it doesn't already exist
if [ "$WORK_SESSIONEXISTS" = "" ]
then
    echo "Creating new $WORK_SESSION"
    # Start New Session with our name
    tmux new-session -d -s $WORK_SESSION

echo "Starting tmux configuration... [DONE]"
echo " "

echo "Initializing screen layout..."
autorandr -l thinkpad-dock-side
echo "Initializing screen layout... [DONE]"
