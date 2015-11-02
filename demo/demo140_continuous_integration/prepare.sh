#!/bin/sh

# Demo parameters
DEMO_NAME=acs-demo140

# Demo script location
SCRIPT_PATH=$(cd "${0%/*}" 2>/dev/null; echo "$PWD"/"${0##*/}")
DEMO_HOME=$(dirname $SCRIPT_PATH)

# Configure TMux and Tmuxinator
mkdir ~/.tmuxinator
cp $DEMO_HOME/.tmuxinator/* ~/.tmuxinator

. ./../../script/config.sh
eval "$(docker-machine env $DEV_MACHINE_NAME)"

cd $DEMO_HOME/../..

# Prepare Docker
cd ci
docker-compose stop
docker-compose rm -f

# Start Docker containers
docker stop $(docker ps -q)

docker-compose build
docker-compose up -d

# Create tmux session
#tmux kill-session -t $DEMO_NAME
#mux $DEMO_NAME
