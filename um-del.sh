#!/bin/bash
# UM Uninstaller Utility (Dspsble) designed for macOS, Linux, and WSL
# All rights reserved to Umber Labs.
# This is free software AS-IS. No warranty is included.
# This script is cross-platform. It will run on macOS, Linux, and WSL.

echo "UM is now being uninstalled..."
sudo rm /usr/local/bin/um
sudo rm /usr/local/bin/um-update
sudo rm /usr/local/bin/um=prop

echo "UM has been uninstalled. We are sad to see you go! If you had any problems, please report them at https://github.com/umberlabs/umber/issues."
