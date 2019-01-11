#!/bin/bash

brew update

brew install \
  ctags      \
  vcsh

vcsh clone https://github.com/ncpierson/dots.git dots
