#!/bin/bash

# https://stackoverflow.com/a/4774063
SCRIPT_DIR="$(cd "$(dirname "$0")"; pwd -P)"

source $SCRIPT_DIR/../networks/php.sh

docker run -dit --restart always \
	--name nginx \
	-p 80:80 -p 443:443 \
	--network $NETWORKNAME \
	-v ${HOME}/gitrepos:${HOME}/gitrepos \
	-v $SCRIPT_DIR/config/sites_enabled:/etc/nginx/conf.d:ro \
	-v $SCRIPT_DIR/config/ssl:/etc/nginx/ssl \
	nginx:stable
