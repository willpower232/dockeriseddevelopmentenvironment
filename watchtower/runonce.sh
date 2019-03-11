#!/bin/bash

CONTAINERNAME="watchtower"

if [ ! "$(docker ps | grep $CONTAINERNAME)" ]; then
	# https://stackoverflow.com/a/4774063
	SCRIPT_DIR="$(cd "$(dirname "$0")"; pwd -P)"

	docker run --rm -it \
		--name $CONTAINERNAME \
		-v /var/run/docker.sock:/var/run/docker.sock \
		v2tec/watchtower \
		--interval 10 --cleanup
fi
