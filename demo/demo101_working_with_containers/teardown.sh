#!/bin/sh

docker stop $(docker ps -aq)
docker rm $(docker ps -qa)
docker rmi -f hello-world
docker rmi -f tutum/hello-world
tmux kill-session -t acs-demo101
