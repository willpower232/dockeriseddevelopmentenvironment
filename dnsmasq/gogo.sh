#!/bin/bash

# https://stackoverflow.com/a/4774063
SCRIPT_DIR="$(cd "$(dirname "$0")"; pwd -P)"

source $SCRIPT_DIR/../networks/php.sh

if [[ "$(docker images -q dnsmasq:latest 2> /dev/null)" == "" ]]; then
	docker build -t dnsmasq $SCRIPT_DIR
fi

docker run -dit --restart always --cap-add NET_ADMIN \
	--name dnsmasq \
	-p 53:53/tcp -p 53:53/udp \
	--network $NETWORKNAME \
	-v $SCRIPT_DIR/config:/etc/dnsmasq:ro \
	dnsmasq
