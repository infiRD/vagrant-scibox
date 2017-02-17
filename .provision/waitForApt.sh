#!/bin/bash
# waitForApt.sh

# Script that will wait for process locking /var/lib/dpkg/lock to finish
# - must be run as root
# - will wait for 120s for lock to get freed
# - if lock is not freed in time, will kill any apt instances running on background
#   and will clean up after them 
# inspired by script from stackoverflow user Radu Rădeanu
# http://askubuntu.com/questions/132059/how-to-make-a-package-manager-wait-if-another-instance-of-apt-is-running

if [ "$EUID" -ne 0 ]
then
    (>&2 echo "Must be root to run waitForApt.sh script")
    exit -1
fi

if (fuser /var/lib/dpkg/lock > /dev/null 2>&1)
    then echo "/var/lib/dpkg/lock is locked"
fi

i=0
tput sc
while (fuser /var/lib/dpkg/lock > /dev/null 2>&1); do
    case $(($i % 4)) in
        0 ) j="-" ;;
        1 ) j="\\" ;;
        2 ) j="|" ;;
        3 ) j="/" ;;
    esac
    tput rc
    echo "[$j] Waiting for other apt instances to finish..."
    sleep 2
    ((i=i+1))
    if ((i > 60))
    then
        echo "    Waiting failed after 2m. Killing all leftover apt instances..."
        ps axf | grep apt | grep -v grep | grep -v waitForApt | awk '{print "sudo kill -9 " $1}' | sh
        # make sure there are no leftover locks
        echo "    Cleaning up..."
        sudo rm /var/lib/apt/lists/lock -f
        sudo rm /var/cache/apt/archives/lock -f
        sudo rm /var/lib/dpkg/lock -f
        break
    fi
done