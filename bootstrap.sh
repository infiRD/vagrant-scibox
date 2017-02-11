#!/bin/bash

# Install some neccesary/useful tools
echo "Installing useful tools..."
sudo apt-get install -y -q curl unzip git zsh

# Install zsh shell with oh-my-zsh
# https://github.com/robbyrussell/oh-my-zsh
rm ~/.oh-my-zsh -rf
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
sudo chsh -s /bin/zsh vagrant


# # install conda: https://conda.io/docs/help/silent.html#linux-and-os-x
# echo "Installing conda ..."
# wget -O $HOME/miniconda-latest.sh https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
# chmod +x $HOME/miniconda-latest.sh
# $HOME/miniconda-latest.sh -f -b -p $HOME/miniconda
# export PATH=$HOME/miniconda/bin:$PATH
# printf "\n%s\n%s\n" "# add miniconda path:" "export PATH="$HOME/miniconda/bin:\$PATH"" >> $HOME/.zshrc >> $HOME/.bashrc
# rm $HOME/miniconda-latest.sh



