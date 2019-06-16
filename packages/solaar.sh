#!/bin/bash

sudo apt-get install       \
  curl                     \
  python-pyudev            \
  python-gi                \
  gir1.2-gtk-3.0           \
  gir1.2-notify-0.7        \
  gir1.2-appindicator3-0.1 \
  -y

curl -L -o /tmp/solaar.tar.gz https://github.com/pwr/Solaar/archive/0.9.2.tar.gz

sudo mkdir -p /opt/solaar
sudo tar -xzf /tmp/solaar.tar.gz -C /opt/solaar --strip 1

pushd /opt/solaar

bash rules.d/install.sh
sudo python setup.py build
sudo python setup.py install

popd
