# For Linux in Chrome OS
#
# Primary usages:
#   * personal laptop
#   * light gaming
#   * light development

# Don't run as sudo!
if [ "$EUID" -eq 0 ]; then
  echo "Must not run as sudo!"
  exit 1
fi

# Must run from project root.
cwd=$(basename `pwd`)
if [ "$cwd" != "spawn" ] && [ "$cwd" != "Spawn" ];
then
  echo "Must run from project root!"
  exit 1
fi

# Core

sudo apt-get update

./packages/dotfiles.sh

# Personal

./packages/discord.sh
./packages/runelite.sh
./packages/slack.sh
./packages/crostini/steam.sh

# Development

sudo apt-get install \
  ack-grep           \
  git                \
  httpie             \
  imagemagick        \
  sqlite3            \
  wget               \
  -y

./packages/gnome-terminal.sh
./packages/node.sh
./packages/tmate.sh
./packages/tmux.sh
./packages/yarn.sh
