#!/bin/zsh
PER_SESSION="per"
DEV_SESSION="dev"
WIKI_SESSION="wiki"

echo "Starting tmux configuration..."
PER_SESSIONEXISTS=$(tmux list-sessions | grep $PER_SESSION)
DEV_SESSIONEXISTS=$(tmux list-sessions | grep $DEV_SESSION)
WIKI_SESSIONEXISTS=$(tmux list-sessions | grep $WIKI_SESSION)

# Only create tmux session if it doesn't already exist if [ "$PER_SESSIONEXISTS" = "" ] then
if [ "$PER_SESSIONEXISTS" = "" ]
then
    echo "Creating new $PER_SESSION"

    tmux new-session -d -s $PER_SESSION
    tmux send-keys 'clear && neomutt' C-m
    tmux split-window -hf
    tmux send-keys 'ikhal' C-m # Switch to bind script?
    tmux split-window
    tmux send-keys 'todo list' C-m # Switch to bind script

    tmux new-window -t $PER_SESSION:2
    tmux send-keys 'ranger' C-m # Switch to bind script?
    tmux split-window -hf
    tmux send-keys 'ncmpcpp' C-m # Switch to bind script?
    tmux split-window
    tmux send-keys 'newsboat' C-m # Switch to bind script?

    tmux new-window -t $PER_SESSION:3
    tmux send-keys 'btop' C-m # Switch to bind script?
    tmux split-window -hf
    tmux send-keys 'ls' C-m # Switch to bind script?
    tmux split-window
    tmux send-keys 'netstat' C-m # Switch to bind script?
fi

if [ "$DEV_SESSIONEXISTS" = "" ]
then
    echo "Creating new $DEV_SESSION"

    tmux new-session -d -s $DEV_SESSION
    tmux send-keys 'clear' C-m
    tmux split-window -hf
    tmux send-keys 'clear' C-m # Switch to bind script?
    tmux split-window
    tmux send-keys 'clear' C-m
fi

# Only create tmux session if it doesn't already exist
if [ "$WIKI_SESSIONEXISTS" = "" ]
then
    echo "Creating new $WIKI_SESSION"

    tmux new-session -d -s $WIKI_SESSION
    tmux send-keys 'cd ~/Sync/wiki && vim index.md' C-m # Switch to bind script?
fi

echo "Starting tmux configuration... [DONE]"
echo " "

tmux attach -t per
