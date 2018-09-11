#! /bin/bash

sudo apt-get install curl -y

curl -L -o /tmp/discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"
sudo dpkg -i /tmp/discord.deb

sudo apt-get --fix-broken install -y
