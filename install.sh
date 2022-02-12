#!/bin/bash

echo "Updating repositories and upgrading packages ..."
sleep 1
sudo apt-get update && sudo apt-get upgrade

echo "Checking to see if Qt6 Installer is installed ..."
cd ~/Downloads
FILE=qt-unified-linux-x64-4.2.0-online.run
if [ -f  "$FILE" ]; then
    echo "Qt6 Installer already installed ..."
    sleep 1
else
    echo "Downloading Qt6 Installer ..."
    sleep 1
    curl -OL https://d13lb3tujbc8s0.cloudfront.net/onlineinstallers/qt-unified-linux-x64-4.2.0-online.run
fi

echo "Running Qt6 Installer ..."
sleep 1
chmod +x qt-unified-linux-x64-4.2.0-online.run
sudo ./qt-unified-linux-x64-4.2.0-online.run

echo "Everything has downloaded. Congratulations!!!"