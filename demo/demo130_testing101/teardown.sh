#!/bin/sh
. ../../config.sh
eval "$(docker-machine env $DEV_MACHINE_NAME)"
docker-compose -f docker-compose-dev.yml stop
docker stop $(docker ps -aq)
docker rm $(docker ps -qa)

tmux kill-session -t acs-demo130
