#! /bin/bash

pushd /tmp

git clone https://github.com/universal-ctags/ctags.git
cd ctags

./autogen.sh
./configure
sudo make
sudo make install

popd
