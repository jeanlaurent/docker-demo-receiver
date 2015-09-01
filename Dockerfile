FROM ubuntu:latest
MAINTAINER Jean-Laurent de Morlhon <jeanlaurent@morlhon.net>

RUN apt-get -y install curl
RUN curl -sL https://deb.nodesource.com/setup_0.12 | bash -
RUN apt-get update
RUN apt-get -y install node.js
RUN apt-get clean

RUN mkdir /receiver
WORKDIR /receiver

COPY package.json /receiver/
COPY receiver.coffee /receiver/

RUN npm install
RUN npm cache clean
CMD node_modules/coffee-script/bin/coffee receiver.coffee
