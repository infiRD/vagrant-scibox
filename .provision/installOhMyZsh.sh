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


# ----------------- LS_COLORS -----------------
# - install and enable enhanced ls coloring 
# see: https://github.com/trapd00r/LS_COLORS
wget https://raw.github.com/trapd00r/LS_COLORS/master/LS_COLORS -O $HOME/.dircolors
LS_COLORS='eval $(dircolors -b $HOME/.dircolors)'
echo $LS_COLORS >> $HOME/.bashrc
echo $LS_COLORS >> $HOME/.zshrc

