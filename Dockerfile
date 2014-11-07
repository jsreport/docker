FROM node:0.10.33
MAINTAINER Jan Blaha
EXPOSE 2945 

RUN apt-get update && apt-get install -y sudo
RUN adduser --disabled-password --gecos "" jsreport
RUN echo "jsreport ALL=(root) NOPASSWD: /usr/local/bin/node" >> /etc/sudoers
RUN echo "jsreport ALL=(root) NOPASSWD: /usr/local/bin/npm" >> /etc/sudoers

VOLUME ["/jsreport"]

WORKDIR /home/jsreport

ADD run.sh /home/jsreport/run.sh

RUN sudo npm install jsreport
RUN sudo node node_modules/jsreport --init
CMD ["bash", "/home/jsreport/run.sh"]

