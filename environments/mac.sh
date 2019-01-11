#!/bin/bash

./packages/mac/brew.sh

./packages/mac/dotfiles.sh
./packages/mac/node.sh
./packages/mac/tmux.sh

brew install \
  rbenv      \
  tmate
