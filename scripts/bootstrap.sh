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

# modify global PATH to point to conda
sudo chmod o+w /etc/profile
sudo printf "\n%s\n%s\n" "# add miniconda path:" "export PATH="$HOME/miniconda/bin:\$PATH"" >> /etc/profile
sudo chmod o-w /etc/profile

# modify vagrant user PATH to point to conda
printf "\n%s\n%s\n" "# add miniconda path:" "export PATH="$HOME/miniconda/bin:\$PATH"" >> $HOME/.zshrc
printf "\n%s\n%s\n" "# add miniconda path:" "export PATH="$HOME/miniconda/bin:\$PATH"" >> $HOME/.bashrc

# modify root user PATH to point to conda
sudo chmod o+x /root
sudo chmod o+w /root/.zshrc /root/.bashrc
sudo printf "\n%s\n%s\n" "# add miniconda path:" "export PATH="$HOME/miniconda/bin:\$PATH"" >> /root/.zshrc
sudo printf "\n%s\n%s\n" "# add miniconda path:" "export PATH="$HOME/miniconda/bin:\$PATH"" >> /root/.bashrc
sudo chmod o-w /root/.zshrc /root/.bashrc
sudo chmod o-x /root

rm $HOME/miniconda-latest.sh
# -------------------------------------------------------------------

# ==================== install conda packages =======================
conda update conda -y
conda install jupyter ipython numpy scipy pandas matplotlib anaconda-client -y

# jupyter lab
# see: https://github.com/jupyterlab/jupyterlab
conda install -c conda-forge jupyterlab -y






