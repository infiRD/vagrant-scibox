#!/bin/bash

# Install some neccesary/useful tools
echo "Replacing shell with oh-my-zsh..."

# Install zsh shell with oh-my-zsh
# https://github.com/robbyrussell/oh-my-zsh
sudo ./waitForApt.sh
sudo apt-get install -y -q zsh

rm ~/.oh-my-zsh -rf
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh 2>&1

# install zsh for vagrant user
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
# replace shell - must be sudo
sudo chsh -s /bin/zsh vagrant

# install zsh for root
sudo cp ~/.oh-my-zsh /root/.oh-my-zsh -a
sudo cp ~/.oh-my-zsh/templates/zshrc.zsh-template /root/.zshrc
sudo chsh -s /bin/zsh root

