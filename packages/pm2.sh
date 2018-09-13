#! /bin/bash

if [ ! -f ~/.nvm/nvm.sh ]
then
  ./packages/node.sh
fi

source ~/.nvm/nvm.sh

npm install -g pm2

STARTUP=$(pm2 startup systemd | tail -1)
eval $STARTUP
