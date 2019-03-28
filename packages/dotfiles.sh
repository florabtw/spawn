#! /bin/bash

sudo apt-get update

sudo apt-get install \
  curl               \
  exuberant-ctags    \
  vim                \
  vcsh               \
  -y

vcsh clone https://github.com/ncpierson/dots.git dots
