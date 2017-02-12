#!/bin/bash

# install conda: https://conda.io/docs/help/silent.html#linux-and-os-x
sh wait_for_apt.sh
echo "Installing conda ..."
wget -O $HOME/miniconda-latest.sh https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
chmod +x $HOME/miniconda-latest.sh
$HOME/miniconda-latest.sh -f -b -p $HOME/miniconda
export PATH=$HOME/miniconda/bin:$PATH
printf "\n%s\n%s\n" "# add miniconda path:" "export PATH="$HOME/miniconda/bin:\$PATH"" >> $HOME/.zshrc >> $HOME/.bashrc
rm $HOME/miniconda-latest.sh







