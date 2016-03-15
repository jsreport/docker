FROM node:4.4.0
MAINTAINER Jan Blaha
EXPOSE 2945 

RUN apt-get update && apt-get install -y sudo
RUN adduser --disabled-password --gecos "" jsreport
RUN echo "jsreport ALL=(root) NOPASSWD: /usr/local/bin/node" >> /etc/sudoers
RUN echo "jsreport ALL=(root) NOPASSWD: /usr/local/bin/npm" >> /etc/sudoers

VOLUME ["/jsreport"]

WORKDIR /home/jsreport

ADD run.sh /home/jsreport/run.sh

RUN sudo npm install jsreport --production
RUN sudo node node_modules/jsreport --init

ENV NODE_ENV production

CMD ["bash", "/home/jsreport/run.sh"]

