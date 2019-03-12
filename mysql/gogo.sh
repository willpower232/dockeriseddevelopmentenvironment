#!/bin/bash

# https://stackoverflow.com/a/4774063
SCRIPT_DIR="$(cd "$(dirname "$0")"; pwd -P)"

source $SCRIPT_DIR/../networks/php.sh

docker run -dit --restart always \
	--name mysql \
	--network-alias mysql-docker
	-p 3306:3306 \
	--network=$NETWORKNAME \
	-v $SCRIPT_DIR/data:/var/lib/mysql \
	-v $SCRIPT_DIR/config:/etc/mysql/conf.d \
	-e MYSQL_ALLOW_EMPTY_PASSWORD=true \
	mysql:5.7
