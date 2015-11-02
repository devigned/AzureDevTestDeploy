#!/bin/sh

. ./script/config.sh
eval "$(docker-machine env $DEV_MACHINE_NAME)"
docker stop $(docker ps -aq)
docker rm $(docker ps -qa)

tmux kill-session -t acs-demo101
