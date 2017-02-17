#!/bin/bash

# Preparation tasks

# ========= transfer and configure waitForApt.sh script ==============
# - script was transfered with vagrant file provisioner
# - replace remove windows like line ending with linux like
# - make executable
cd ~
cat waitForApt.sh | tr -d '\15\32' > waitForApt.sh.tmp 
mv waitForApt.sh.tmp waitForApt.sh
chmod +x waitForApt.sh

# -------------------------------------------------------------------


