#! /bin/bash

sudo apt-get install curl

curl -L -o /tmp/firefox.tar.bz2 "https://download.mozilla.org/?product=firefox-devedition-latest-ssl&os=linux64&lang=en-US"
sudo tar -xjf /tmp/firefox.tar.bz2 -C /opt/

sudo bash -c 'cat << EOF > /usr/share/applications/firefox.desktop
[Desktop Entry]
Version=1.0
Name=Firefox Developer Edition
Comment=Browse the World Wide Web
Icon=/opt/firefox/browser/chrome/icons/default/default128.png
Exec=/opt/firefox/firefox
Terminal=false
Type=Application
Categories=Network;WebBrowser;
Actions=Default;Mozilla;ProfileManager;
EOF'
