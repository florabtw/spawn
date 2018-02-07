# Don't run as sudo!
if [ "$EUID" -eq 0 ]; then
  echo "Must not run as sudo!"
  exit 1
fi

# GPG Keys

## Mongo
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6
echo "deb [ arch=amd64,arm64 ] http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.4.list

## Yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

sudo apt-get update

# Generic Installs

sudo apt-get install \
  git                \
  vcsh               \
  mongodb-org        \
  yarn               \
  ack-grep           \
  sqlite3            \
  ffmpeg             \
  imagemagick        \
  exuberant-ctags    \
  -y

# Special Installs

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
