#!/bin/zsh
PER_SESSION="per"
WIKI_SESSION="wiki"
SSH_SESSION="ssh"
PRO_SESSION="pro"

echo "Starting tmux configuration..."
PER_SESSIONEXISTS=$(tmux list-sessions | grep $PER_SESSION)
WIKI_SESSIONEXISTS=$(tmux list-sessions | grep $WIKI_SESSION)
SSH_SESSIONEXISTS=$(tmux list-sessions | grep $SSH_SESSION)
PRO_SESSIONEXISTS=$(tmux list-sessions | grep $PRO_SESSION)

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
    tmux send-keys 'ranger' C-m # Switch to bind script?
    tmux split-window -hf
    tmux send-keys 'ncmpcpp' C-m # Switch to bind script?
    tmux split-window
    tmux send-keys 'newsboat' C-m # Switch to bind script?
fi

# Only create tmux session if it doesn't already exist
if [ "$WIKI_SESSIONEXISTS" = "" ]
then
    echo "Creating new $WIKI_SESSION"

    tmux new-session -d -s $WIKI_SESSION
    tmux send-keys 'cd Sync/wiki && vim index.md' C-m # Switch to bind script?
fi

if [ "$SSH_SESSIONEXISTS" = "" ]
then
    echo "Creating new $SSH_SESSION"

    tmux new-session -d -s $SSH_SESSION
    tmux send-keys 'ssh vps' C-m
    tmux split-window -hf
    tmux send-keys 'ssh proxmox' C-m # Switch to bind script?
    tmux split-window
    tmux send-keys 'ssh fileserver' C-m
fi

# Only create tmux session if it doesn't already exist
if [ "$PRO_SESSIONEXISTS" = "" ]
then
    echo "Creating new $PRO_SESSION"

    tmux new-session -d -s $PRO_SESSION
    tmux send-keys 'vim' C-m
    tmux split-window -p 67
fi

echo "Starting tmux configuration... [DONE]"
echo " "

#echo "Loading mpd config..."
#mpd ~/.config/mpd/mpd.conf
#echo "Loading mpd config... [DONE]"
#echo " "
