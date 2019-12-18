#! /bin/bash

sudo apt-get update

./packages/universal-ctags.sh

sudo apt-get install \
  curl               \
  vim                \
  vcsh               \
  -y

vcsh clone https://github.com/ncpierson/dots.git dots
