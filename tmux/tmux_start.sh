#!/bin/bash

SESSION="main"

echo "Launched tmux script from $(hostname)!"

if [ $(hostname) = "lenov156dsy" ]; then 
		echo "  No need to patch tmux libs"
else
		export LD_LIBRARY_PATH="/udir/vemeraud/local_RedHat/lib:$LD_LIBRARY_PATH"
		export PATH="~vemeraud/local_RedHat/bin:$PATH"
		echo "  Patching tmux libs"
		echo "    LD_LIBRARY_PATH=$LD_LIBRARY_PATH"
		echo "    PATH=$PATH"
fi;

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
tmux send-keys "cd ~/svn/mercury/cloudview/trunk" C-m
OpenThreePanes
tmux select-pane -t 2
tmux clock-mode

# src-1 window
tmux new-window -t $SESSION:1 -n 'src-1'
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
tmux new-window -t $SESSION:2 -n 'src-2'
OpenEightPanes
tmux select-pane -t 0
tmux send-keys "cd ~/svn_publi/edk/edk/trunk" C-m
tmux select-pane -t 1
tmux send-keys "cd ~/svn_publi/platform/semantic/trunk" C-m
tmux select-pane -t 2
tmux send-keys "cd ~/svn_publi/platform/platform-base/trunk" C-m
tmux select-pane -t 3
tmux send-keys "cd ~/svn_publi/platform/index6/trunk" C-m
tmux select-pane -t 4
tmux send-keys "cd ~/svn_publi/platform/apollo-core/trunk" C-m
tmux select-pane -t 5
tmux send-keys "cd ~/svn_publi/platform/cvcore-native/trunk" C-m
tmux select-pane -t 6
tmux send-keys "cd ~/svn_publi/platform/cloudview-core/trunk" C-m
tmux select-pane -t 7
tmux send-keys "cd ~/svn_publi/platform/apollo-bench/trunk" C-m

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
tmux send-keys "cd ~/svn/mercury/mami-java-tests/trunk" C-m

# Set default window
tmux select-window -t $SESSION:0

# Attach to session
tmux attach-session -t $SESSION

