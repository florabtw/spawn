# Don't run as sudo!
if [ "$EUID" -eq 0 ]; then
  echo "Must not run as sudo!"
  exit 1
fi

# Make sure we have curl

sudo apt-get install curl

# Repos

## Spotify
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0DF731E45CE24F27EEEB1450EFDC8610341D9410
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list

## Google Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list

## Flux
sudo add-apt-repository ppa:nathan-renniewaldock/flux

## Mongo
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6
echo "deb [ arch=amd64,arm64 ] http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.4.list

## Yarn

curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

## LibreOffice

sudo add-apt-repository ppa:libreoffice/ppa

sudo apt-get update

# Installs

sudo apt-get install             \
  ack-grep                       \
  deluge                         \
  exuberant-ctags                \
  ffmpeg                         \
  fluxgui                        \
  imagemagick                    \
  gconf2                         \
  gdebi                          \
  gimp                           \
  git                            \
  git-gui                        \
  gitk                           \
  google-chrome-stable           \
  httpie                         \
  libreoffice                    \
  mongodb-org -y                 \
  spotify-client                 \
  sqlite3                        \
  vcsh                           \
  vim                            \
  virtualbox                     \
  virtualbox-guest-additions-iso \
  yarn                           \

# Special

## Discord

curl -L -o /tmp/discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"
sudo dpkg -i /tmp/discord.deb

## Slack

curl -L -o /tmp/slack.deb "https://downloads.slack-edge.com/linux_releases/slack-desktop-3.0.0-amd64.deb"
dpkg -i /tmp/slack.deb

## Firefox Developer Edition
# TODO Fix this

# curl -L -o /tmp/firefox.tar.bz2 "https://download.mozilla.org/?product=firefox-devedition-latest-ssl&os=linux64&lang=en-US"
# tar -xjf /tmp/firefox.tar.bz2 -C /opt/
#
# sudo cat <<EOF > /usr/share/applications/Firefox.desktop
# [Desktop Entry]
# Version=1.0
# Name=Firefox Developer Edition
# Comment=Browse the World Wide Web
# Icon=/opt/firefox/browser/icons/mozicon128.png
# Exec=/opt/firefox/firefox
# Terminal=false
# Type=Application
# Categories=Network;WebBrowser;
# Actions=Default;Mozilla;ProfileManager;
# EOF

## Dotfiles

vcsh clone https://github.com/ncpierson/dots.git dots

## Node / NVM

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.6/install.sh | bash
source ~/.nvm/nvm.sh
nvm install --lts

## MongoDB

sudo service mongod start
systemctl enable mongod.service

## Tmux

sudo apt-get remove tmux -y
sudo apt-get install build-essential libevent-dev ncurses-dev -y

pushd /tmp/

wget https://github.com/tmux/tmux/releases/download/2.6/tmux-2.6.tar.gz
tar -xzf tmux-2.6.tar.gz
cd tmux-2.6
./configure && make
sudo make install

popd
