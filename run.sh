# file run.sh
#!/bin/sh

if [ -d "/jsreport" ]; then 

  # link data folder from mounted volume

  if [ ! -d "/jsreport/data" ]; then 
    mkdir "/jsreport/data"
  fi

  ln -nsf "/jsreport/data" "/home/jsreport/data"

  # copy default config  

  if [ ! -f "/jsreport/prod.config.json" ]; then    
    cp "/home/jsreport/prod.config.json" "/jsreport/prod.config.json"    
  fi

  # delete default config and link from volume
	
  rm -f "/home/jsreport/prod.config.json"
  ln -s "/jsreport/prod.config.json" "/home/jsreport/prod.config.json"

  chown -R jsreport:jsreport /jsreport
fi

su jsreport
sudo node "/home/jsreport/server.js" --httpsPort=2945
