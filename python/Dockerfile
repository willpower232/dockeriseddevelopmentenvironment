FROM python:3.7-alpine

RUN apk add gcc musl-dev make libffi-dev openssl-dev
RUN pip install ansible

RUN apk add bash

RUN mkdir /home/wh \
	&& adduser -h /home/wh -s /bin/bash -D -u 1000 wh \
	&& chown -R wh:wh /home/wh

USER wh

WORKDIR /home/wh
