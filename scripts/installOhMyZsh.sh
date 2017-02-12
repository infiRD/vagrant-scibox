#!/bin/bash

# Install some neccesary/useful tools
echo "Replacing shell with oh-my-zsh..."
sudo ./waitForApt.sh
sudo dpkg --configure -a
sudo apt-get install -y -q curl unzip git zsh

# Install zsh shell with oh-my-zsh
# https://github.com/robbyrussell/oh-my-zsh
rm ~/.oh-my-zsh -rf
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh 2>&1
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc

# replace shell - must be sudo
sudo chsh -s /bin/zsh vagrant
