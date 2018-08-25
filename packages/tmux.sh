#! /bin/bash

sudo apt-get remove tmux -y
sudo apt-get install build-essential libevent-dev ncurses-dev -y

pushd /tmp/

wget https://github.com/tmux/tmux/releases/download/2.6/tmux-2.6.tar.gz
tar -xzf tmux-2.6.tar.gz
cd tmux-2.6
./configure && make
sudo make install

popd
