tmux kill-session -t acs-demo120

docker stop $(docker ps -q)

SCRIPT_PATH=$(cd "${0%/*}" 2>/dev/null; echo "$PWD"/"${0##*/}")
echo $SCRIPT_PATH
DEMO_HOME=$(dirname $SCRIPT_PATH)
echo Demo Home is $DEMO_HOME

mkdir ~/.tmuxinator
cp $DEMO_HOME/.tmuxinator/* ~/.tmuxinator

docker-compose -f docker-compose-dev.yml up -d
docker-compose -f docker-compose-dev.yml scale web=1
docker-compose -f docker-compose-dev.yml stop
docker-compose -f docker-compose-dev.yml rm -f

mux acs-demo3
