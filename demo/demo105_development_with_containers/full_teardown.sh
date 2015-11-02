#!/bin/sh
eval "$(docker-machine env dev)"
docker stop $(docker ps -aq)

tmux kill-session -t acs-demo105
