#!/bin/bash
# Umber Updater

echo "Umber Updater: Starting..."

function err_exit() {
    echo "Installation failed. Please try again."
    exit 1
}
trap "err_exit" ERR

export DEBIAN_FRONTEND=noninteractive

read -r -p "Umber Updater: Update Umber? [Y/n] " hb
case $hb in
    [yY][eE][sS]|[yY])
        echo "Umber Updater: Removing old Umber..."
        sudo rm /usr/local/bin/um
        echo "Umber Updater: Downloading new Umber..."
        cd /opt
        sudo mkdir uu
        cd uu
        sudo git clone https://github.com/js3r2/umber
        cd umber
        sudo mv um /usr/local/bin
        echo "Umber Updater: Updated! Cleaning up..."
        cd /opt
        sudo rm -rf uu
        sudo chmod +x /usr/local/bin/um
        sudo chmod -R 777 /usr/local/bin/um
        sudo chmod +x /usr/local/bin/um-update
        sudo chmod -R 777 /usr/local/bin/um-update
    ;;
    [nN][oO]|[nN]|'')
        echo "Canceled update."
    ;;
esac
