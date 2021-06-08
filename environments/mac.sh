#!/bin/bash

./packages/mac/brew.sh
./packages/mac/dotfiles.sh

./packages/node.sh

brew install \
  gpg        \
  tmux
