#!/bin/bash

CONTAINERNAME="watchtower"

if [ ! "$(docker ps | grep $CONTAINERNAME)" ]; then
	# if watchtower updates and restarts itself, you will have to ask docker to stop it
	# its easier to get watchtower updated before it starts
	docker pull containrrr/watchtower

	# ( sleep 30 ; docker stop $CONTAINERNAME ) &

	docker run --rm -it \
		--name $CONTAINERNAME \
		-v /var/run/docker.sock:/var/run/docker.sock \
		-e TZ=Europe/London \
		containrrr/watchtower \
		--interval 10 --cleanup
fi
