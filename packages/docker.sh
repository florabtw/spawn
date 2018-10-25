#!/bin/bash

sudo apt-get update

sudo apt-get install  \
  apt-transport-https \
  ca-certificates     \
  curl                \
  software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

RELEASE=$(lsb_release -cs)

sudo add-apt-repository \
  "deb [arch=amd64] https://download.docker.com/linux/ubuntu $RELEASE stable"

sudo apt-get update

sudo apt-get install docker-ce -y

sudo usermod -aG docker $USER


# docker-compose

sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

# refresh the shell

exec su -l $USER
