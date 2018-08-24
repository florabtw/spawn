# Don't run as sudo!
if [ "$EUID" -eq 0 ]; then
  echo "Must not run as sudo!"
  exit 1
fi

# Make sure we have curl

sudo apt-get install curl

# Repos

## Yarn

curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

## Update

sudo apt-get update

# Installs

sudo apt-get install             \
  exuberant-ctags                \
  git                            \
  httpie                         \
  imagemagick                    \
  libgconf-2-4                   \
  sqlite3                        \
  vcsh                           \
  vim                            \
  wget                           \
  yarn                           \

# Special

## Discord

curl -L -o /tmp/discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"
sudo dpkg -i /tmp/discord.deb

## Slack

curl -L -o /tmp/slack.deb "https://downloads.slack-edge.com/linux_releases/slack-desktop-3.0.0-amd64.deb"
sudo dpkg -i /tmp/slack.deb

## Dotfiles

vcsh clone https://github.com/ncpierson/dots.git dots

## Node / NVM

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
source ~/.nvm/nvm.sh
nvm install --lts

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
