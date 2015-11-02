#!/bin/sh
. ./script/config.sh
eval "$(docker-machine env $DEV_MACHINE_NAME)"
docker-compose -f docker-compose-dev.yml stop
docker-compose -f docker-compose-dev.yml rm -f

tmux kill-session -t acs-demo120
