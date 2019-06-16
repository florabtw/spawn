#!/bin/bash

sudo add-apt-repository ppa:yubico/stable -y
sudo apt-get update
sudo apt-get install \
  libpam-yubico      \
  yubikey-manager    \
  -y

# passwordless ubuntu:
# https://support.yubico.com/support/solutions/articles/15000011355-ubuntu-linux-login-guide-challenge-response
