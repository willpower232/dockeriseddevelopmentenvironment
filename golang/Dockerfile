# alpine is nice but I had problems building with it
#FROM golang:1.19-alpine
#RUN apk add bash
#	&& adduser -h /home/wp -s /bin/bash -D -u 1000 wp \

FROM golang:1.19-bullseye

# we need to add a user as with PHP
# but it needs to be the first UID
# so have to remove the node user for compatibility
RUN mkdir /home/wp \
	&& useradd -d /home/wp -s /bin/bash -u 1000 wp \
	&& chown -R wp:wp /home/wp

USER wp

WORKDIR /home/wp

RUN mkdir go && mkdir -p .cache/go-build

VOLUME [ "/home/wp/go" ]
VOLUME [ "/home/wp/.cache/go-build" ]
