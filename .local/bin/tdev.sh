#!/bin/bash
tmux send-keys 'nvim .' C-m
tmux split-window -h
tmux resize-pane -R 30
tmux send-keys 'opencode .' C-m
tmux select-pane -t 1
tmux split-window -v
tmux resize-pane -D 20
tmux send-keys 'clear' C-m
tmux select-pane -t 1
