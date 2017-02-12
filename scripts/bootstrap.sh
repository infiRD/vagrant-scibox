#!/bin/bash

# make sure no apt tasks are running in the background
sudo ./waitForApt.sh

# install conda: 
echo "Installing conda ..."

# ======================== install conda ============================
# https://conda.io/docs/help/silent.html#linux-and-os-x
# - download latest
wget --progress=bar:force:noscroll -O $HOME/miniconda-latest.sh \
  https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh 2>&1

# - execute it
chmod +x $HOME/miniconda-latest.sh
$HOME/miniconda-latest.sh -f -b -p $HOME/miniconda

# modify current shell session PATH to point to conda
export PATH=$HOME/miniconda/bin:$PATH

# and all future BASH and ZSH sessions PATH to point to conda
printf "\n%s\n%s\n" "# add miniconda path:" "export PATH="$HOME/miniconda/bin:\$PATH"" >> $HOME/.zshrc
printf "\n%s\n%s\n" "# add miniconda path:" "export PATH="$HOME/miniconda/bin:\$PATH"" >> $HOME/.bashrc

rm $HOME/miniconda-latest.sh
# -------------------------------------------------------------------

# ==================== install conda packages =======================






