#!/bin/bash

SESSION="main"

if tmux has-session -t $SESSION
then
  echo "Session $SESSION already exist."
  exit 1
fi

OpenThreePanes() {
  tmux split-window -v
  tmux split-window -h
}

OpenFourPanes() {
  tmux split-window -h
  tmux split-window -v
  tmux select-pane -t 0
  tmux split-window -v
}

OpenEightPanes() {
  tmux split-window -h
  tmux split-window -v
  tmux select-pane -t 0
  tmux split-window -v
  tmux select-pane -t 0
  tmux split-window -v
  tmux select-pane -t 2
  tmux split-window -v
  tmux select-pane -t 4
  tmux split-window -v
  tmux select-pane -t 6
  tmux split-window -v
}

# new session
tmux -2 new-session -d -s $SESSION -n 'main'

# main window
tmux send-keys "cd ~/svn/mercury/cloudview/trunk" C-m
OpenThreePanes
tmux select-pane -t 2
tmux clock-mode

# src-1 window
tmux new-window -t $SESSION:1 -n 'src-1'
OpenEightPanes
tmux select-pane -t 0
tmux send-keys "cd ~/svn/platform/platform-base/trunk" C-m
tmux select-pane -t 1
tmux send-keys "cd ~/svn/platform/platform-base/trunk_publish" C-m
tmux select-pane -t 2
tmux send-keys "cd ~/svn/platform/apollo-core/trunk" C-m
tmux select-pane -t 3
tmux send-keys "cd ~/svn/platform/apollo-core/trunk_publish" C-m
tmux select-pane -t 4
tmux send-keys "cd ~/svn/platform/index6/trunk" C-m
tmux select-pane -t 5
tmux send-keys "cd ~/svn/platform/index6/trunk_publish" C-m
tmux select-pane -t 6
tmux send-keys "cd ~/svn/platform/cloudview-core/trunk" C-m
tmux select-pane -t 7
tmux send-keys "cd ~/svn/platform/cloudview-core/trunk_publish" C-m

# src-2 window
tmux new-window -t $SESSION:2 -n 'src-2'
OpenFourPanes
tmux select-pane -t 0
tmux send-keys "cd ~/svn/edk/edk/trunk" C-m
tmux select-pane -t 1
tmux send-keys "cd ~/svn/edk/edk/trunk_publish" C-m
tmux select-pane -t 2
tmux send-keys "cd ~/svn/platform/semantic/trunk" C-m
tmux select-pane -t 3
tmux send-keys "cd ~/svn/platform/semantic/trunk_publish" C-m
tmux select-pane -t 4
tmux send-keys "cd ~/svn/platform/cvcore-native/trunk" C-m
tmux select-pane -t 5
tmux send-keys "cd ~/svn/platform/cvcore-native/trunk_publish" C-m
tmux select-pane -t 6
tmux send-keys "cd ~/svn/platform/apollo-bench/trunk" C-m
tmux select-pane -t 7
tmux send-keys "cd ~/svn/platform/apollo-bench/trunk_publish" C-m

# datadir window
tmux new-window -t $SESSION:3 -n 'datadir'
tmux send-keys "cd ~/datadir" C-m
tmux split-window -v

# tools window
tmux new-window -t $SESSION:4 -n 'tools'
tmux send-keys "cd ~/tools" C-m
OpenFourPanes

# qa window
tmux new-window -t $SESSION:5 -n 'qa'
tmux send-keys "cd ~/" C-m
OpenThreePanes
tmux select-pane -t 0
tmux send-keys "cd ~/svn/mercury/apollo-tests/trunk" C-m
tmux select-pane -t 1
tmux send-keys "cd ~/svn/mercury/mercury-tests/trunk" C-m
tmux select-pane -t 2
tmux send-keys "cd ~/svn/mercury/mami-java-test/trunk" C-m

# Set default window
tmux select-window -t $SESSION:0

# Attach to session
tmux attach-session -t $SESSION

# kill it
tmux kill-session -t $SESSION
