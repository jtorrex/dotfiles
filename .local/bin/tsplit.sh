#!/bin/bash
tmux split-window -h
tmux split-window -v
tmux split-window -v
tmux select-pane -t 1
tmux split-window -v
tmux select-pane -t 3
tmux split-window -v
tmux select-pane -t 2
tmux resize-pane -D 19
tmux select-pane -t 1
