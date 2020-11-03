#!/bin/bash

echo "Launched tmux script from $(hostname)!"

source ~/tmux-env.sh

SESSION="cv"

if tmux has-session -t $SESSION
then
  tmux kill-session -t $SESSION
  echo "Session $SESSION killed."
  exit 0
else
  echo "Session $SESSION did not exist, nothing to do."
fi

