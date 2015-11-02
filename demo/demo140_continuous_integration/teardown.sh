#!/bin/sh
. ./../../script/config.sh
eval "$(docker-machine env $DEV_MACHINE_NAME)"

# Prepare Docker
cd ../../ci
docker-compose stop

# Start Docker containers
docker stop $(docker ps -q)
