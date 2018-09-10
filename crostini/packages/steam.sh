#! /bin/bash

# For Debian

sudo apt-get install curl -y

sudo usermod -aG video,audio $USER

sudo cp /etc/apt/sources.list /tmp/sources.list.bak

sudo bash -c 'cat << EOF > /etc/apt/sources.list
deb http://deb.debian.org/debian stretch         main contrib non-free
deb http://security.debian.org/  stretch/updates main contrib non-free
EOF'

sudo dpkg --add-architecture i386

sudo apt-get update

sudo apt-get install   \
  libgl1-mesa-dri:i386 \
  libgl1-mesa-glx:i386 \
  libglapi-mesa:i386  \
  -y

sudo apt-get install steam -y

curl -L -o /tmp/steam.deb "https://steamcdn-a.akamaihd.net/client/installer/steam.deb"

sudo dpkg -i /tmp/steam.deb
