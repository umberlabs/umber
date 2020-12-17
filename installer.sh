#!/bin/bash
echo "UM Installer: Loaded main script. Starting..."

function err_exit() {
    echo "Installation failed. Please try again."
    exit 1
}
trap "err_exit" ERR

export DEBIAN_FRONTEND=noninteractive

read -r -p "UM Installer: Install UM? [Y/n] " hb
case $hb in
    [yY][eE][sS]|[yY])
        echo "UM Installer: Installing package js3r2/main..."
        git clone https://github.com/umberlabs/umber um
        cd umber
        sudo mv um /usr/local/bin
        sudo chmod +x /usr/local/bin/um
        sudo chmod -R 777 /usr/local/bin/um
        mv update.sh um-update
        sudo mv um-update /usr/local/bin
        sudo chmod +x /usr/local/bin/um-update
        sudo chmod -R 777 /usr/local/bin/um-update
        echo "UM Installer: Summary: um & um-update have been installed to /usr/local/bin."
        cd 
        rm -rf um
    ;;
    [nN][oO]|[nN]|'')
        echo "UM Installer: Skipping..."
    ;;
esac