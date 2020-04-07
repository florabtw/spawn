#! /bin/bash

sudo apt-get install curl -y

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.35.3/install.sh | bash

source ~/.nvm/nvm.sh

nvm install --lts
