#jsreport/jsreport

[jsreport/jsreport](https://registry.hub.docker.com/u/jsreport/jsreport/)  is a [docker](https://www.docker.com/) based image for easily running [jsreport](http://jsreport.net) reporting server.

##Usage

1. Install [Docker](https://www.docker.com/)
2. `sudo docker run -p 443:2945 jsreport/jsreport`

This is the most basic usage. It will start jsreport server on port 443 directly in the current shell with data and configuration stored directly in container. Change 443 https port to whatever you want.

However it is recommended to run jsreport in the following way.

1. create directory where the jsreport persistent data and configuration will resists
2. `sudo docker run -d -p 80:5488 --restart always -v /jsreport-home:/jsreport jsreport/jsreport`  where the first `/jsreport-home` path is path to directory created in the previous step

This will start jsreport as a daemon and restart it after system reboot as well.  `/jsreport-home` folder will be used to store persistent data and configuration. Changes will take an effect after container restart.