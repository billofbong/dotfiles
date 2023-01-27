#!/bin/bash
# This script should be run with sudo

echo "Stowing..."
apt install stow
stow bash
stow vim

echo "Installing requirements for vim..."
apt install curl
echo "Installing nodejs..."
curl -fsSL https://deb.nodesource.com/setup_19.x | sudo -E bash - &&\
    apt-get install -y nodejs

