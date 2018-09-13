# For hosting websites on a DigitalOcean Droplet

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

# Hosting

sudo apt-get install nginx

./packages/node.sh
./packages/yarn.sh
./packages/pm2.sh

# Firewall Setup

sudo ufw allow OpenSSH
sudo ufw allow 'Nginx Full'
sudo ufw enable
