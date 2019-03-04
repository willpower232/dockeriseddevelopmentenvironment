FROM node:11-alpine

# laravel mix dependencies
#RUN apt update && apt install -y \
#	libpng-dev \
#	make

# add global dependency
#RUN npm install -g grunt

RUN apk add bash

# we need to add a user as with PHP
# but it needs to be the first UID
# so have to remove the node user for compatibility
RUN mkdir /home/wh \
	&& deluser node \
	&& adduser -h /home/wh -s /bin/bash -D -u 1000 wh \
	&& chown -R wh:wh /home/wh

USER wh

# https://blog.npmjs.org/post/141702881055/package-install-scripts-vulnerability
# it would be nice to do this but it breaks a lot of use cases
# RUN npm config set ignore-scripts true

WORKDIR /home/wh
