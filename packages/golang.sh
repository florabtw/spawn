#!/bin/bash

sudo apt-get install curl

curl -L -o /tmp/golang.tar.gz "https://dl.google.com/go/go1.11.2.linux-amd64.tar.gz"
sudo tar -xzf /tmp/golang.tar.gz -C /usr/local/lib

sudo ln -s /usr/local/lib/go/bin/* /usr/local/bin/

cat << EOF >> ~/.bashrc
export GOPATH=\$HOME/.gopath
export PATH=\$GOPATH:\$GOPATH/bin:\$PATH
EOF
