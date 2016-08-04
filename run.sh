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

  if [ ! -f "/jsreport/dev.config.json" ]; then
      cp "/home/jsreport/dev.config.json" "/jsreport/dev.config.json"
  fi

  # delete default config and link from volume
	
  rm -f "/home/jsreport/prod.config.json"
  ln -s "/jsreport/prod.config.json" "/home/jsreport/prod.config.json"

  rm -f "/home/jsreport/dev.config.json"
  ln -s "/jsreport/dev.config.json" "/home/jsreport/dev.config.json"

  chown -R jsreport:jsreport /jsreport
fi

su jsreport

NODE_ENV=${NODE_ENV:-production} node "/home/jsreport/server.js"