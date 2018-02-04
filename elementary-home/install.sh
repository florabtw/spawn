# Must run as sudo, must be able to access username of user

if [ -z "$SUDO_USER" ]; then
  echo "Must run as sudo"
  exit 1
fi

USER=$SUDO_USER

# Elementary OS Specific

apt-get install software-properties-common
apt-get remove epiphany-browser

## Pantheon Terminal -> Gnome Terminal

apt-get install gnome-terminal
sed -i '/^OnlyShowIn/d' /usr/share/applications/gnome-terminal.desktop
apt-get remove pantheon-terminal

# Repos

## Spotify
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0DF731E45CE24F27EEEB1450EFDC8610341D9410
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list

## Google Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list

## Flux
add-apt-repository ppa:nathan-renniewaldock/flux

## Mongo
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6
echo "deb [ arch=amd64,arm64 ] http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.4.list

## Yarn

curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

## LibreOffice
add-apt-repository ppa:libreoffice/ppa

apt-get update

# Installs

apt-get install libindicator7
apt-get install libappindicator1
apt-get install libc++1
apt-get install gconf2
apt-get install virtualbox
apt-get install virtualbox-guest-additions-iso
apt-get install git
apt-get install gitk
apt-get install git-gui
apt-get install google-chrome-stable
apt-get install spotify-client
apt-get install vim
apt-get install vcsh
apt-get install fluxgui
apt-get install mongodb-org -y
apt-get install yarn
apt-get install libreoffice
apt-get install ack-grep
apt-get install deluge
apt-get install gimp
apt-get install sqlite3
apt-get install gdebi
apt-get install ffmpeg

# Special

## Discord

curl -L -o /tmp/discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"
sudo dpkg -i /tmp/discord.deb

## Slack

curl -L -o /tmp/slack.deb "https://downloads.slack-edge.com/linux_releases/slack-desktop-3.0.0-amd64.deb"
dpkg -i /tmp/slack.deb

## Firefox Developer Edition

curl -L -o /tmp/firefox.tar.bz2 "https://download.mozilla.org/?product=firefox-devedition-latest-ssl&os=linux64&lang=en-US"
tar -xjf /tmp/firefox.tar.bz2 -C /opt/
chown -R $USER:$USER /opt/firefox

cat <<EOF > /usr/share/applications/Firefox.desktop
[Desktop Entry]
Version=1.0
Name=Firefox Developer Edition
Comment=Browse the World Wide Web
Icon=/opt/firefox/browser/icons/mozicon128.png
Exec=/opt/firefox/firefox
Terminal=false
Type=Application
Categories=Network;WebBrowser;
Actions=Default;Mozilla;ProfileManager;
EOF

## Vim / Config

if ! sudo -u $USER vcsh list | grep -q vim; then
  sudo -u $USER vcsh clone https://github.com/ncpierson/dotfiles-vim.git vim
  sudo -u $USER vcsh vim submodule update --init
  sudo -u $USER vim +PluginInstall +qall
fi

## Git / Config

if ! vcsh list | grep -q git; then
  sudo -u $USER vcsh clone https://github.com/ncpierson/dotfiles-git.git
fi

## Node / NVM

su - $USER -c "curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.6/install.sh | bash"
su - $USER -c "source ~/.nvm/nvm.sh; nvm install --lts"

## MongoDB

sudo service mongod start
systemctl enable mongod.service
