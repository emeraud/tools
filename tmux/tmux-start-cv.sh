#!/bin/bash

echo "Launched tmux script from $(hostname)!"

source ~/tmux-env.sh

SESSION="cv"

if tmux has-session -t $SESSION
then
  tmux attach -t $SESSION
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
tmux select-pane -t 0
tmux send-keys "cd ~/svn/mercury/cloudview/trunk" C-m
tmux select-pane -t 1
tmux send-keys "cd ~/svn/mercury/cloudview/trunk" C-m
OpenThreePanes
tmux select-pane -t 2
tmux send-keys "cd ~/svn/mercury/cloudview/trunk" C-m
tmux clock-mode

# src-1 window
tmux new-window -t $SESSION:1 -n 'svn'
OpenEightPanes
tmux select-pane -t 0
tmux send-keys "cd ~/svn/edk/edk/trunk" C-m
tmux select-pane -t 1
tmux send-keys "cd ~/svn/platform/semantic/trunk" C-m
tmux select-pane -t 2
tmux send-keys "cd ~/svn/platform/platform-base/trunk" C-m
tmux select-pane -t 3
tmux send-keys "cd ~/svn/platform/index6/trunk" C-m
tmux select-pane -t 4
tmux send-keys "cd ~/svn/platform/apollo-core/trunk" C-m
tmux select-pane -t 5
tmux send-keys "cd ~/svn/platform/cvcore-native/trunk" C-m
tmux select-pane -t 6
tmux send-keys "cd ~/svn/platform/cloudview-core/trunk" C-m
tmux select-pane -t 7
tmux send-keys "cd ~/svn/platform/apollo-bench/trunk" C-m

# src-2 window
tmux new-window -t $SESSION:2 -n 'jenkins'
OpenThreePanes
tmux select-pane -t 0
tmux send-keys "cd ~/jenkins" C-m
tmux select-pane -t 1
tmux send-keys "cd ~/jenkins" C-m
tmux select-pane -t 2
tmux send-keys "cd ~/jenkins" C-m

# datadir window
tmux new-window -t $SESSION:3 -n 'datadir'
tmux split-window -v
tmux select-pane -t 0
tmux send-keys "cd ~/datadir" C-m
tmux select-pane -t 1
tmux send-keys "cd ~/datadir" C-m

# tools window
tmux new-window -t $SESSION:4 -n 'tools'
OpenFourPanes
tmux select-pane -t 0
tmux send-keys "cd ~/tools/eclipse" C-m
tmux select-pane -t 1
tmux send-keys "cd ~/tools/yourkit" C-m
tmux select-pane -t 2
tmux send-keys "cd ~/tools/eclipseMemoryAnalyzer" C-m
tmux select-pane -t 3
tmux send-keys "cd ~/tools/jenkins" C-m

# qa window
tmux new-window -t $SESSION:5 -n 'qa'
tmux split-window -h
tmux select-pane -t 0
tmux send-keys "cd ~/svn/mercury/mercury-tests/trunk" C-m
tmux select-pane -t 1
tmux send-keys "cd ~/svn/mercury/mami-java-tests/trunk" C-m

# fullCompil window
tmux new-window -t $SESSION:6 -n 'fullCompil'
tmux split-window -h
tmux select-pane -t 0
tmux send-keys "cd ~/sh" C-m
tmux select-pane -t 1
tmux send-keys "cd ~/sh" C-m

# Set default window
tmux select-window -t $SESSION:0

# Attach to session
tmux attach-session -t $SESSION

