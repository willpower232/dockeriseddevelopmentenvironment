#FROM python:3.7-alpine
#RUN apk add gcc musl-dev make libffi-dev openssl-dev
#RUN apk add bash
#	&& adduser -h /home/wh -s /bin/bash -D -u 1000 wh \

# fun fact, slim-stretch with ansible is slightly smaller than alpine with ansible

FROM python:3.7-slim-stretch

RUN pip install ansible

RUN mkdir /home/wh \
	&& useradd wh --shell /bin/bash \
	&& chown -R wh:wh /home/wh

USER wh

WORKDIR /home/wh
