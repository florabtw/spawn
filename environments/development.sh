# For a remote development server
#
# Primary usages:
#   * heavy development
#   * light web hosting

# Don't run as sudo!
if [ "$EUID" -eq 0 ]; then
  echo "Must not run as sudo!"
  exit 1
fi

# Must run from project root.

if [ "$(basename `pwd`)" != "spawn" ]
then
  echo "Must run from project root!"
  exit 1
fi

# Core

sudo apt-get update

./packages/dotfiles.sh

# Development

sudo apt-get install \
  ffmpeg             \
  git                \
  httpie             \
  imagemagick        \
  sqlite3            \
  unzip              \
  wget               \
  -y

./packages/mongo.sh
./packages/node.sh
./packages/tmux.sh
./packages/yarn.sh
