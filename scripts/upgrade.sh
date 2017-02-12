#!/bin/bash

# Update package info
echo "Updating package info..."
./waitForApt.sh
dpkg --configure -a
apt-get --yes update --fix-missing -q

# Remove unwanted packages
echo "Removing unwanted packages..."
# it showwed to be not so good idea to remove default python ... :)
# sudo apt-get remove --purge python-minimal python python3 -y -q

# Upgrade
echo "Upgrading..."
pwd
./waitForApt.sh
# prevent UI and accept default options: 
# this is neccesary because otherwise for example grub will 
# block the process with GUI, which is not available, so 
# provisioning would freeze
DEBIAN_FRONTEND=noninteractive apt-get -y -q -o \
    Dpkg::Options::="--force-confdef" -o \
    Dpkg::Options::="--force-confold" upgrade

