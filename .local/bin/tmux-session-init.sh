#!/bin/zsh
PER_SESSION="per"
DEV_SESSION="dev"
WIKI_SESSION="wiki"
MON_SESSION="mon"

echo "Starting tmux configuration..."
PER_SESSIONEXISTS=$(tmux list-sessions | grep $PER_SESSION)
DEV_SESSIONEXISTS=$(tmux list-sessions | grep $DEV_SESSION)
WORK_SESSIONEXISTS=$(tmux list-sessions | grep $WORK_SESSION)
MON_SESSIONEXISTS=$(tmux list-sessions | grep $MON_SESSION)
WIKI_SESSIONEXISTS=$(tmux list-sessions | grep $WIKI_SESSION)

# Only create tmux session if it doesn't already exist if [ "$PER_SESSIONEXISTS" = "" ] then
if [ "$PER_SESSIONEXISTS" = "" ]
then
    echo "Creating new $PER_SESSION"
    tmux new-session -d -s $PER_SESSION
    tmux send-keys 'clear && neomutt' C-m
    tmux new-window -t $PER_SESSION:2
    tmux send-keys 'ncmpcpp' C-m
    tmux new-window -t $PER_SESSION:3
    tmux send-keys 'yazi' C-m 
    tmux new-window -t $PER_SESSION:4
    tmux send-keys 'newsboat' C-m
    tmux new-window -t $PER_SESSION:5
    tmux send-keys 'ssh-keys-init.sh' C-m
fi

if [ "$DEV_SESSIONEXISTS" = "" ]
then
    echo "Creating new $DEV_SESSION"

    tmux new-session -d -s $DEV_SESSION
    tmux send-keys 'clear' C-m
    tmux new-window -t $DEV_SESSION:2
    tmux send-keys 'tsplit.sh' C-m
fi

if [ "$MON_SESSIONEXISTS" = "" ]
then
    echo "Creating new $MON_SESSION"
    tmux new-session -d -s $MON_SESSION
    tmux send-keys 'btop' C-m
    tmux new-window -t $MON_SESSION:2
    tmux send-keys 'bmon' C-m
    tmux new-window -t $MON_SESSION:3
    tmux send-keys 'duf' C-m
fi

if [ "$WIKI_SESSIONEXISTS" = "" ]
then
    echo "Creating new $WIKI_SESSION"

    tmux new-session -d -s $WIKI_SESSION
    tmux send-keys 'cd ~/Sync/wiki && vim index.md' C-m
fi

echo "Starting tmux configuration... [DONE]"
echo " "

tmux attach -t per
