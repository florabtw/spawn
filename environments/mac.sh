#!/bin/bash

./packages/mac/brew.sh
./packages/mac/dotfiles.sh
./packages/mac/tmux.sh

./packages/node.sh

brew install \
  tmate
