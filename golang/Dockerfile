# alpine is nice but I had problems building with it
#FROM golang:1.19-alpine
#RUN apk add bash
#	&& adduser -h /home/wp -s /bin/bash -D -u 1000 wp \

FROM golang:1.22-bookworm

# we need to add a user as with PHP
# but it needs to be the first UID
RUN mkdir /home/wp \
	&& useradd -d /home/wp -s /bin/bash -u 1000 wp \
	&& chown -R wp:wp /home/wp

USER wp

WORKDIR /home/wp

RUN mkdir go
ENV GOPATH=/home/wp/go
