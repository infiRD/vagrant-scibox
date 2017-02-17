#!/bin/bash
# disableAutoUpdate.sh

# Script that disables autoupdate on ubuntu. Particularly 16.04
# see: https://github.com/boxcutter/ubuntu/issues/73

echo "Disabling automatic update service... (issue on Ubuntu 16.04)"
echo "If you want to enable it"
echo "> sudo systemctl enable apt-daily.timer apt-daily.service"

systemctl disable apt-daily.timer apt-daily.service   >/dev/null 2>/dev/null
systemctl stop apt-daily.timer apt-daily.service      >/dev/null 2>/dev/null

sed -i.bak 's/^Prompt=.*$/Prompt=never/' /etc/update-manager/release-upgrades

# killing is not neccesary. stop apt-daily.service does the job
# leaving following line for reference
# ps axf | grep apt | grep -v grep | awk '{print "sudo kill -9 " $1}' | sh

