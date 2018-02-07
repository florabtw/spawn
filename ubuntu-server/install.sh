# Must run as sudo, must be able to access username of user

if [ "$EUID" -eq 0 ]; then
  echo "Must not run as sudo!"
  exit 1
fi

# Update repos

sudo apt-get update

# Installations

sudo apt-get install \
  vcsh               \
  exuberant-ctags    \
  nginx              \
  -y

# Vim / Config

vcsh clone https://github.com/ncpierson/dots.git dots

# NVM / Node

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.6/install.sh | bash
source ~/.nvm/nvm.sh
nvm install --lts

# Node Dependencies

npm install -g yarn
npm install -g pm2

# PM2 Setup

STARTUP=$(pm2 startup systemd | tail -1)
eval $STARTUP

# Firewall Setup (DigitalOcean Specific)

sudo ufw allow OpenSSH
sudo ufw allow 'Nginx Full'
sudo ufw enable
