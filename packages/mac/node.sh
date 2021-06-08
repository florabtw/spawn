#!/bin/bash

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.38.0/install.sh | bash

source ~/.nvm/nvm.sh

nvm install --lts
