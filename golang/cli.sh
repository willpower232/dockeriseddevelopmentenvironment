#!/bin/bash

CONTAINERNAME="golang1"

# https://stackoverflow.com/a/4774063
SCRIPT_DIR="$(cd "$(dirname "$0")"; pwd -P)"

if [[ "$(docker images -q $CONTAINERNAME:latest 2> /dev/null)" == "" ]]; then
	docker build -t $CONTAINERNAME $SCRIPT_DIR
fi

docker run -i --rm \
	--name $CONTAINERNAME \
	-h $CONTAINERNAME \
	-v $SCRIPT_DIR/config/bashrc:${HOME}/.bashrc:ro \
	-v ${HOME}/gitrepos:${HOME}/gitrepos \
	-v /tmp:/hosttmp \
	-v $SCRIPT_DIR/caches/go-build:${HOME}/.cache/go-build \
	-v $SCRIPT_DIR/caches/home:${HOME}/go \
	-w "$PWD" \
	$CONTAINERNAME \
	/usr/local/go/bin/go \
	$@
