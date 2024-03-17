#!/bin/bash

CONTAINERNAME="portainer"

if [ ! "$(docker ps | grep $CONTAINERNAME)" ]; then
	# https://stackoverflow.com/a/4774063
	SCRIPT_DIR="$(cd "$(dirname "$0")"; pwd -P)"

	source $SCRIPT_DIR/../networks/php.sh

	docker run -dit --restart always \
		--name $CONTAINERNAME \
		--network-alias $CONTAINERNAME-docker \
		--network $NETWORKNAME \
		-v $SCRIPT_DIR/data:/data \
		-v /var/run/docker.sock:/var/run/docker.sock \
		portainer/portainer-ce:2.18.4
fi
