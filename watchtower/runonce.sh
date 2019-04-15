#!/bin/bash

CONTAINERNAME="watchtower"

if [ ! "$(docker ps | grep $CONTAINERNAME)" ]; then
	# watchtower has trouble updating itself in this configuration just so you know
	docker pull containrrr/watchtower

	( sleep 30 ; docker stop $CONTAINERNAME ) &

	docker run --rm -it \
		--name $CONTAINERNAME \
		-v /var/run/docker.sock:/var/run/docker.sock \
		-e TZ=Europe/London \
		containrrr/watchtower \
		--interval 10 --cleanup
fi
