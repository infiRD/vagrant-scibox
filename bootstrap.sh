#!/bin/bash

# Update present packages
echo "Updating present packages ..."
# sudo dpkg --configure -a
# sudo apt-get --yes update
# prevent kernel upgrade
# sudo apt-mark hold linux-image-generic linux-headers-generic
# sudo apt-get --yes upgrade


# # Remove unwanted packages
# echo "Removing unwanted packages ..."
# sudo apt-get remove python3 python --yes


# # Install some neccesary/useful tools



# # Install zsh shell
# echo "Removing unwanted packages ..."
# sudo apt-get remove python3 python --yes



# # install conda: https://conda.io/docs/help/silent.html#linux-and-os-x
# echo "Installing conda ..."
# wget -O $HOME/miniconda-latest.sh https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
# chmod +x $HOME/miniconda-latest.sh
# $HOME/miniconda-latest.sh -f -b -p $HOME/miniconda
# export PATH=$HOME/miniconda/bin:$PATH
# printf "\n%s\n%s\n" "# add miniconda path:" "export PATH="$HOME/miniconda/bin:\$PATH"" >> $HOME/.zshrc >> $HOME/.bashrc
# rm $HOME/miniconda-latest.sh



