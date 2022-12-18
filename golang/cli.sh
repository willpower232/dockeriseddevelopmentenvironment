#!/bin/bash

CONTAINERNAME="golang1"

# this has to be hardcoded because this file needs symlinking to the $PATH
SCRIPT_DIR="/home/wp/containers/golang"

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
