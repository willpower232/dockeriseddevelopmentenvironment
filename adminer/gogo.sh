#!/bin/bash

CONTAINERNAME="adminer"

if [ ! "$(docker ps | grep $CONTAINERNAME)" ]; then
	# https://stackoverflow.com/a/4774063
	SCRIPT_DIR="$(cd "$(dirname "$0")"; pwd -P)"

	source $SCRIPT_DIR/../gogo_network.sh

	docker run -dit --restart always \
		--name $CONTAINERNAME \
		--network-alias $CONTAINERNAME-docker \
		--network $NETWORKNAME \
		adminer:standalone
fi
