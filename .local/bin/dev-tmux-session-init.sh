#!/bin/zsh
DEV_SESSION="dev"
WORK_SESSION="work"
MON_SESSION="mon"

echo "Starting tmux configuration..."
DEV_SESSIONEXISTS=$(tmux list-sessions | grep $DEV_SESSION)
WORK_SESSIONEXISTS=$(tmux list-sessions | grep $WORK_SESSION)
MON_SESSIONEXISTS=$(tmux list-sessions | grep $MON_SESSION)

if [ "$DEV_SESSIONEXISTS" = "" ]
then
    echo "Creating new $DEV_SESSION"

    tmux new-session -d -s $DEV_SESSION
    tmux send-keys 'clear' C-m
    tmux new-window -t $DEV_SESSION:2
    tmux send-keys 'clear' C-m
    tmux new-window -t $DEV_SESSION:3
    tmux send-keys 'clear' C-m
    tmux new-window -t $DEV_SESSION:4
    tmux send-keys 'clear' C-m
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
    tmux new-window -t $WORK_SESSION:4
    tmux send-keys 'clear' C-m
fi

if [ "$MON_SESSIONEXISTS" = "" ]
then
    echo "Creating new $MON_SESSION"
    tmux new-session -d -s $MON_SESSION
    tmux send-keys 'clear' C-m
    tmux new-window -t $MON_SESSION:2
    tmux send-keys 'clear' C-m
    tmux new-window -t $MON_SESSION:3
    tmux send-keys 'clear' C-m
    tmux new-window -t $MON_SESSION:4
    tmux send-keys 'clear' C-m
fi

echo "Starting tmux configuration... [DONE]"
echo " "

tmux attach -t dev
