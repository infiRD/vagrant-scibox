#!/bin/bash

# Update package info
echo "Updating package info..."
sudo dpkg --configure -a
sudo apt-get --yes update --fix-missing -q

# Remove unwanted packages
echo "Removing unwanted packages..."
# it showwed to be not so good idea to remove default python ... :)
# sudo apt-get remove --purge python-minimal python python3 -y -q

# Upgrade
echo "Upgrading..."
# prevent any prompt during upgrade: http://askubuntu.com/questions/146921/how-do-i-apt-get-y-dist-upgrade-without-a-grub-config-prompt
sudo DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" dist-upgrade

./bootstrap.sh


