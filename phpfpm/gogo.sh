#!/bin/bash

# https://stackoverflow.com/a/4774063
SCRIPT_DIR="$(cd "$(dirname "$0")"; pwd -P)"

source $SCRIPT_DIR/../networks/php.sh

if [[ "$(docker images -q phpfpm71:latest 2> /dev/null)" == "" ]]; then
	docker build -t phpfpm71 $SCRIPT_DIR
fi

docker run -dit --restart always \
	--name phpfpm \
	-h phpfpm \
	-p 9000:9000 \
	--network=$NETWORKNAME \
	-v ${HOME}/.aws/credentials:${HOME}/.aws/credentials:ro \
	-v ${HOME}/gitrepos:${HOME}/gitrepos \
	-v $SCRIPT_DIR/config/bashrc:${HOME}/.bashrc:ro \
	-v $SCRIPT_DIR/config/phpfpm.conf:/usr/local/etc/php-fpm.d/www.conf:ro \
	-v $SCRIPT_DIR/config/phpcli.ini:/usr/local/etc/php/conf.d/zz-custom.ini:ro \
	phpfpm71
