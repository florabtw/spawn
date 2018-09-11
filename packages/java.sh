#! /bin/bash

sudo apt-get install         \
  gnupg                      \
  software-properties-common \
  -y

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 73C3DB2A
sudo add-apt-repository ppa:linuxuprising/java -y

sudo apt-get update

sudo apt-get install        \
  oracle-java10-installer   \
  oracle-java10-set-default \
  -y
