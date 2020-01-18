#! /bin/bash

sudo apt-get install curl

curl -L -o /tmp/slack.deb "https://downloads.slack-edge.com/linux_releases/slack-desktop-4.1.1-amd64.deb"
sudo dpkg -i /tmp/slack.deb

sudo apt-get --fix-broken install -y
