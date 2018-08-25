#! /bin/bash

sudo apt-get install software-properties-common -y

sudo add-apt-repository ppa:linuxuprising/java -y

sudo apt-get update

sudo apt-get install        \
  oracle-java10-installer   \
  oracle-java10-set-default \
  -y
