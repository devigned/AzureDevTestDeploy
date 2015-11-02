#!/bin/sh

SCRIPT_PATH=$(cd "${0%/*}" 2>/dev/null; echo "$PWD"/"${0##*/}")
echo $SCRIPT_PATH
DEMO_HOME=$(dirname $SCRIPT_PATH)
echo Demo Home is $DEMO_HOME

mkdir ~/.tmuxinator
cp $DEMO_HOME/.tmuxinator/* ~/.tmuxinator

tmux kill-session -t acs-demo105


cd $DEMO_HOME/../../
. ./script/config.sh
echo 'dev machine name is:'
echo $DEV_MACHINE_NAME
eval "$(docker-machine env $DEV_MACHINE_NAME)"
docker stop $(docker ps -aq)
./script/dev.sh
docker stop dev_load

mux acs-demo105
