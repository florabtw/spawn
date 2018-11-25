#! /bin/bash

sudo apt-get install         \
  gnupg                      \
  software-properties-common \
  -y

echo "deb http://ppa.launchpad.net/linuxuprising/java/ubuntu bionic main" | sudo tee /etc/apt/sources.list.d/linuxuprising-java.list
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 73C3DB2A

sudo apt-get update

sudo apt-get install        \
  oracle-java11-installer   \
  oracle-java11-set-default \
  -y
