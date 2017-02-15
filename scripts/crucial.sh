#!/bin/bash

# ================== install crucial packages =======================
sudo ./waitForApt.sh
sudo dpkg --configure -a
sudo apt-get update --fix-missing

sudo apt-get install -y -q curl unzip git zsh autogen automake \
                           autoconf build-essential checkinstall \
                           make gcc g++ 

# -------------------------------------------------------------------


