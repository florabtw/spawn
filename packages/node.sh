#! /bin/bash

sudo apt-get install curl -y

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash

source ~/.nvm/nvm.sh

nvm install --lts
