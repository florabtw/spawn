#! /bin/bash

./packages/java.sh

sudo apt-get install curl

curl -L -o /tmp/runelite.jar "https://github.com/runelite/launcher/releases/download/1.6.0/RuneLite.jar"
curl -L -o /tmp/runelite.png "https://runelite.net/img/logo.png"

sudo mkdir /opt/runelite
sudo mv /tmp/runelite.jar /opt/runelite/
sudo mv /tmp/runelite.png /opt/runelite/

sudo bash -c 'cat <<"EOF" > /opt/runelite/run.sh
#! /bin/bash
SCALE=${1:-0.5}
if [ -x "$(command -v sommelier)" ]; then
  sommelier -X --scale=$SCALE --no-exit-with-child -- \
    java -jar /opt/runelite/runelite.jar --mode=OFF
else
  java -jar /opt/runelite/runelite.jar
fi
EOF'

sudo chmod +x /opt/runelite/run.sh

sudo bash -c 'cat << EOF > /usr/share/applications/runelite.desktop
[Desktop Entry]
Version=1.0
Name=RuneLite
Comment=Play Old School Runescape!
Icon=/opt/runelite/runelite.png
Exec=/opt/runelite/run.sh
Terminal=false
Type=Application
Categories=Network
EOF'
