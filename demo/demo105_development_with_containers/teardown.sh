#!/bin/sh
eval "$(docker-machine env dev)"
docker stop $(docker ps -aq)
docker rm $(docker ps -qa)
docker rmi -f rest web

tmux kill-session -t acs-demo105
