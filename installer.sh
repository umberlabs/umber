#!/bin/bash
echo "UM Installer: Loaded main script. Starting..."

function err_exit() {
    echo "Installation failed. Please try again."
    exit 1
}
trap "err_exit" ERR

echo "UM Installer: Installing package umberlabs/main..."
cd /Users/$USER
git clone https://github.com/umberlabs/umber um
cd um
sudo mv um-prop /usr/local/bin
sudo chmod +x /usr/local/bin/um-prop
sudo chmod -R 777 /usr/local/bin/um-prop
sudo mv um /usr/local/bin
sudo chmod +x /usr/local/bin/um
sudo chmod -R 777 /usr/local/bin/um
mv update.sh um-update
sudo mv um-update /usr/local/bin
sudo chmod +x /usr/local/bin/um-update
sudo chmod -R 777 /usr/local/bin/um-update
cd /Users/$USER/
rm -rf um
echo "Finished!"
