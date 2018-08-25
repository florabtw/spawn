# Don't run as sudo!
if [ "$EUID" -eq 0 ]; then
  echo "Must not run as sudo!"
  exit 1
fi

# Core

sudo apt-get update

./packages/dotfiles.sh

# Personal

./packages/discord.sh
./packages/slack.sh

# Development

sudo apt-get install \
  git                \
  httpie             \
  imagemagick        \
  sqlite3            \
  wget

./packages/node.sh
./packages/tmux.sh
./packages/yarn.sh
