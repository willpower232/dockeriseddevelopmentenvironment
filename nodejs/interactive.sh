#!/bin/bash

# https://stackoverflow.com/a/4774063
SCRIPT_DIR="$(cd "$(dirname "$0")"; pwd -P)"

if [[ "$(docker images -q nodejs10:latest 2> /dev/null)" == "" ]]; then
        docker build -t nodejs10 $SCRIPT_DIR
fi

docker run -it --rm \
	--name nodejs \
	-h nodejs \
        -v $SCRIPT_DIR/config/bashrc:${HOME}/.bashrc:ro \
        -v ${HOME}/gitrepos:${HOME}/gitrepos \
	-w "$PWD" \
       nodejs10 \
       bash
