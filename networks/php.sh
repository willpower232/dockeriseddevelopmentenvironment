#!/bin/bash

NETWORKNAME="developmentenvironment_php"

if [ ! "$(docker network ls | grep $NETWORKNAME)" ]; then
	docker network create -d bridge $NETWORKNAME
fi
