FROM ubuntu:22.04

#author
LABEL maintainer="Reinaldo Acosta <12644557+reinaldoacosta@users.noreply.github.com>"
LABEL version="1.0"
LABEL description="This is a base image for development based on Ubuntu 22.04"

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=America/Caracas
ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8
ENV GIT_SSH_COMMAND="ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"

RUN apt update
RUN apt install git -y
RUN git clone https://github.com/reinaldoacosta/dev-setup.git /tmp/setup
RUN cd /tmp/setup && ./install
RUN rm -rf /tmp/setup
RUN apt clean

WORKDIR /root
