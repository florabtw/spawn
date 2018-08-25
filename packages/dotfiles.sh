#! /bin/bash

sudo apt-get update

sudo apt-get install \
  exuberant-ctags    \
  vim                \
  vcsh               \
  -y

vcsh clone https://github.com/ncpierson/dots.git dots
