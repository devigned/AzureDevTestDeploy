tmux kill-session -t acs-demo120

SCRIPT_PATH=$(cd "${0%/*}" 2>/dev/null; echo "$PWD"/"${0##*/}")
echo $SCRIPT_PATH
DEMO_HOME=$(dirname $SCRIPT_PATH)
echo Demo Home is $DEMO_HOME

. ./../../script/config.sh
eval "$(docker-machine env $DEV_MACHINE_NAME)"
docker stop $(docker ps -q)

mkdir ~/.tmuxinator
cp $DEMO_HOME/.tmuxinator/* ~/.tmuxinator

cd $DEMO_HOME/../..
docker-compose -f docker-compose-dev.yml up -d
docker-compose -f docker-compose-dev.yml scale web=1
docker-compose -f docker-compose-dev.yml stop
docker-compose -f docker-compose-dev.yml rm -f

mux acs-demo120
