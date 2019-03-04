#!/bin/bash

CONTAINERNAME="nodejs11"

# https://stackoverflow.com/a/4774063
SCRIPT_DIR="$(cd "$(dirname "$0")"; pwd -P)"

if [[ "$(docker images -q $CONTAINERNAME:latest 2> /dev/null)" == "" ]]; then
	docker build -t $CONTAINERNAME $SCRIPT_DIR
fi

# as the container is created with --rm, it will be removed
# when the service stops or the first process exits
# but if there is one running already, we can just hop into it
# rather than try to recreate an existing container
if [ ! "$(docker ps | grep $CONTAINERNAME)" ]; then
	docker run -it --rm \
		--name $CONTAINERNAME \
		-h $CONTAINERNAME \
		-v $SCRIPT_DIR/config/bashrc:${HOME}/.bashrc:ro \
		-v ${HOME}/gitrepos:${HOME}/gitrepos \
		-v $SCRIPT_DIR/caches/npm:${HOME}/.npm \
		-w "$PWD" \
		$CONTAINERNAME \
		bash
else
	docker exec -it -w "$PWD" $CONTAINERNAME bash
fi
