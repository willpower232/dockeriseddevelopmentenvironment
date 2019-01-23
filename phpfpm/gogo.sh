#!/bin/bash

# https://stackoverflow.com/a/4774063
SCRIPT_DIR="$(cd "$(dirname "$0")"; pwd -P)"

source $SCRIPT_DIR/../networks/php.sh

if [[ "$(docker images -q phpfpm71:latest 2> /dev/null)" == "" ]]; then
	docker build -t phpfpm71 $SCRIPT_DIR
fi

# use DNSMASQ so it can resolve the .zz addresses to the host for assets in PDFs
# whilst the fallback seems to work, it might not be the best solution
# so if not using DNSMASQ then remove the --dns line below

# try and get the dnsmasq ip address or the default if it fails
DNSMASQ="$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' dnsmasq 2>/dev/null || echo '127.0.0.11')"

# trim whitespace at the start
DNSMASQ="$(echo $DNSMASQ)"

docker run -dit --restart always \
	--name phpfpm \
	-h phpfpm \
	--network $NETWORKNAME \
	--dns $DNSMASQ \
	-v ${HOME}/.aws/credentials:${HOME}/.aws/credentials:ro \
	-v ${HOME}/gitrepos:${HOME}/gitrepos \
	-v $SCRIPT_DIR/config/bashrc:${HOME}/.bashrc:ro \
	-v $SCRIPT_DIR/config/phpfpm.conf:/usr/local/etc/php-fpm.d/www.conf:ro \
	-v $SCRIPT_DIR/config/phpcli.ini:/usr/local/etc/php/conf.d/zz-custom.ini:ro \
	phpfpm71
