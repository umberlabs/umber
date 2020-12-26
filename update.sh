#!/bin/bash
# Umber Updater v1.3.7b2

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
        cd /opt
        sudo mkdir uu
        cd uu
        sudo git clone https://github.com/umberlabs/umber
        cd umber
        sudo chmod -R 777 um-del.sh
        sudo chmod +x um-del.sh
        ./um-del.sh
        echo "Umber Updater: Launching Installer..."
        cd /opt/uu/umber
        sudo chmod +x installer.sh
        sudo chmod -R 777 installer.sh
        ./installer.sh
        echo "Cleaning up..."
        cd /opt
        sudo rm -rf uu
        sudo chmod +x /usr/local/bin/um
        sudo chmod -R 777 /usr/local/bin/um
        sudo chmod +x /usr/local/bin/um-prop
        sudo chmod -R 777 /usr/local/bin/um-prop
        sudo chmod +x /usr/local/bin/um-update
        sudo chmod -R 777 /usr/local/bin/um-update
        echo "Update complete!"
    ;;
    [nN][oO]|[nN]|'')
        echo "Canceled update."
    ;;
esac
