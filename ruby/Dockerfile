#FROM ruby:2.3-slim-jessie
#RUN apt update && apt install -y gcc make
#	&& useradd --shell /bin/bash --uid 1000 wh \

# slim jessie quite a bit bigger than alpine but you do you

FROM ruby:2.3-alpine

RUN apk add gcc musl-dev make libffi-dev openssl-dev
RUN apk add bash

RUN gem install sass
RUN gem install aws-sdk

RUN mkdir /home/wh \
	&& adduser -h /home/wh -s /bin/bash -D -u 1000 wh \
	&& chown -R wh:wh /home/wh

USER wh

WORKDIR /home/wh
