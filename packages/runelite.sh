#! /bin/bash

./packages/java.sh

sudo apt-get install curl

curl -L -o /tmp/runelite.jar "https://github.com/runelite/launcher/releases/download/1.6.0/RuneLite.jar"
curl -L -o /tmp/runelite.png "https://runelite.net/img/logo.png"

sudo mkdir /opt/runelite
sudo mv /tmp/runelite.jar /opt/runelite/
sudo mv /tmp/runelite.png /opt/runelite/

sudo bash -c 'cat <<EOF > /opt/runelite/run.sh
java -jar /opt/runelite/runelite.jar --mode=OFF
EOF'

sudo chmod +x /opt/runelite/run.sh

sudo bash -c 'cat << EOF > /usr/share/applications/runelite.desktop
[Desktop Entry]
Version=1.0
Name=RuneLite
Comment=Play Runescape!
Icon=/opt/runelite/runelite.png
Exec=/opt/runelite/run.sh
Terminal=false
Type=Application
Categories=Network
EOF'
