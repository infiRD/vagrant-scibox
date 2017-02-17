#!/bin/bash

# make sure no apt tasks are running in the background
sudo ./waitForApt.sh

# install conda: 
echo "Installing conda..."

# ======================== install conda ============================
# https://conda.io/docs/help/silent.html#linux-and-os-x
# - download latest
wget --progress=bar:force:noscroll -O $HOME/miniconda-latest.sh \
  https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh 2>&1

# - execute it
chmod +x $HOME/miniconda-latest.sh
$HOME/miniconda-latest.sh -f -b -p $HOME/.miniconda

# modify current shell session PATH to point to conda
export PATH=$HOME/.miniconda/bin:$PATH

rm $HOME/miniconda-latest.sh
# -------------------------------------------------------------------


# ==================== install conda packages =======================
conda update conda -y
conda install -y jupyter ipython numpy scipy pandas matplotlib \
                 anaconda-client scikit-image

# jupyter lab
# see: https://github.com/jupyterlab/jupyterlab
conda install -c conda-forge jupyterlab -y
# -------------------------------------------------------------------


# ======================== install julia ============================
cd $HOME
wget --progress=bar:force:noscroll -O julia.tar.gz \
  https://julialang.s3.amazonaws.com/bin/linux/x64/0.5/julia-0.5.0-linux-x86_64.tar.gz 2>&1
tar -xzf julia.tar.gz
rm julia -rf
mv `ls | grep julia- | grep -v tar` .julia
rm julia.tar.gz

# modify current shell session PATH to point to julia
export PATH=$HOME/.julia/bin:$PATH

# install prerequisites for julia packages
sudo apt-get install -y -q gettext hdf5-tools tcl8.5 libcairo2 \
                           libpango1.0-0 tk8.5

# -------------------------------------------------------------------


# ========================= modify PATH =============================
PATH_PREFIX="$HOME/.miniconda/bin:$HOME/.julia/bin:"
printf "\n%s\n%s\n" "# added path by vagrant provisioning:" \
       "export PATH="$PATH_PREFIX\$PATH"" > path_prefix.tmp

# modify global PATH
sudo chmod o+w /etc/profile
sudo cat path_prefix.tmp >> /etc/profile
sudo chmod o-w /etc/profile

# modify vagrant user PATH
cat path_prefix.tmp >> $HOME/.zshrc
cat path_prefix.tmp >> $HOME/.bashrc

# modify root user PATH
sudo chmod o+x /root
sudo chmod o+w /root/.zshrc /root/.bashrc
cat path_prefix.tmp >> /root/.zshrc
cat path_prefix.tmp >> /root/.bashrc
sudo chmod o-w /root/.zshrc /root/.bashrc
sudo chmod o-x /root

rm path_prefix.tmp
# -------------------------------------------------------------------
