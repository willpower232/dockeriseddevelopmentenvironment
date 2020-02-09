# don't use alpine for python images https://pythonspeed.com/articles/alpine-docker-python/

FROM python:3.7-slim-stretch

RUN pip install ansible

# if you have known servers you will be connecting to with ansible, you should ssh-keyscan them to avoid ssh confirmation prompts
#RUN apt update && apt install -y openssh-client
#RUN touch /etc/ssh/ssh_known_hosts
#RUN for server in your.server.example.com your.other.server.example.com; do ssh-keyscan "$server" >> /etc/ssh/ssh_known_hosts; done

# if you aren't using keyfiles for SSH authentication you will need sshpass
#RUN apt install -y sshpass

RUN mkdir /home/wh \
	&& useradd wh --shell /bin/bash \
	&& chown -R wh:wh /home/wh

USER wh

WORKDIR /home/wh
