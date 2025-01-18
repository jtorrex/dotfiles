#!/bin/zsh
PER_SESSION="per"
DEV_SESSION="dev"
WIKI_SESSION="wiki"
WORK_SESSION="work"

echo "Starting tmux configuration..."
PER_SESSIONEXISTS=$(tmux list-sessions | grep $PER_SESSION)
DEV_SESSIONEXISTS=$(tmux list-sessions | grep $DEV_SESSION)
WIKI_SESSIONEXISTS=$(tmux list-sessions | grep $WIKI_SESSION)
WORK_SESSIONEXISTS=$(tmux list-sessions | grep $WORK_SESSION)

# Only create tmux session if it doesn't already exist if [ "$PER_SESSIONEXISTS" = "" ] then
if [ "$PER_SESSIONEXISTS" = "" ]
then
    echo "Creating new $PER_SESSION"

    tmux new-session -d -s $PER_SESSION
    tmux send-keys 'clear && neomutt' C-m

    tmux new-window -t $PER_SESSION:2
    tmux send-keys 'ikhal' C-m

    tmux new-window -t $PER_SESSION:3
    tmux send-keys 'todo list' C-m

    tmux new-window -t $PER_SESSION:4
    tmux send-keys 'ranger' C-m 

    tmux new-window -t $PER_SESSION:5
    tmux send-keys 'ncmpc' C-m

    tmux new-window -t $PER_SESSION:6
    tmux send-keys 'newsboat' C-m

    tmux new-window -t $PER_SESSION:7
    tmux send-keys 'btop' C-m
fi

if [ "$DEV_SESSIONEXISTS" = "" ]
then
    echo "Creating new $DEV_SESSION"

    tmux new-session -d -s $DEV_SESSION
    tmux send-keys 'clear' C-m
    tmux new-window -t $DEV_SESSION:2
    tmux send-keys 'clear' C-m
    tmux new-window -t $DEV_SESSION:3
    tmux send-keys 'clear' C-m
fi

# Only create tmux session if it doesn't already exist
if [ "$WIKI_SESSIONEXISTS" = "" ]
then
    echo "Creating new $WIKI_SESSION"

    tmux new-session -d -s $WIKI_SESSION
    tmux send-keys 'cd ~/Sync/wiki && vim index.md' C-m
fi

if [ "$WORK_SESSIONEXISTS" = "" ]
then
    echo "Creating new $WORK_SESSION"

    tmux new-session -d -s $WORK_SESSION
    tmux send-keys 'clear' C-m
    tmux new-window -t $WORK_SESSION:2
    tmux send-keys 'clear' C-m
    tmux new-window -t $WORK_SESSION:3
    tmux send-keys 'clear' C-m
fi

echo "Starting tmux configuration... [DONE]"
echo " "

tmux attach -t per
