#!/bin/bash


echo "Launched tmux script from $(hostname)!"

source ~/tmux-env.sh

SESSION="main"

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

# new session
tmux -2 new-session -d -s $SESSION -n 'main'
tmux send-keys "cd ~/" C-m

# main window
OpenThreePanes
tmux select-pane -t 0
tmux send-keys "cd ~/apollo" C-m
tmux select-pane -t 1
tmux send-keys "cd ~/apollo/apollo" C-m
tmux select-pane -t 2
tmux send-keys "cd ~/apollo/apollo" C-m
tmux clock-mode

# git window
tmux new-window -t $SESSION:1 -n 'git'
OpenFourPanes
tmux select-pane -t 0
tmux send-keys "cd ~/apollo/apollo" C-m
tmux select-pane -t 1
tmux send-keys "cd ~/apollo/qa" C-m
tmux select-pane -t 2
tmux send-keys "cd ~/apollo/others" C-m
tmux select-pane -t 3
tmux send-keys "cd ~/apollo/rdf" C-m

# git-2 window
tmux new-window -t $SESSION:2 -n 'git-2'
OpenFourPanes
tmux select-pane -t 0
tmux send-keys "cd ~/apollo/sgi" C-m
tmux select-pane -t 1
tmux send-keys "cd ~/apollo/er-crawler" C-m
tmux select-pane -t 2
tmux send-keys "cd ~/apollo/er-crawler" C-m
tmux select-pane -t 3
tmux send-keys "cd ~/apollo" C-m

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

# garbage window
tmux new-window -t $SESSION:5 -n 'garbage'
tmux split-window -v
tmux select-pane -t 0
tmux send-keys "cd ~/garbage" C-m
tmux select-pane -t 1
tmux send-keys "cd ~/garbage" C-m

# sh window
tmux new-window -t $SESSION:6 -n 'sh'
tmux split-window -h
tmux select-pane -t 0
tmux send-keys "cd ~/" C-m
tmux select-pane -t 1
tmux send-keys "cd ~/" C-m

# Set default window
tmux select-window -t $SESSION:0

# Attach to session
tmux attach-session -t $SESSION

