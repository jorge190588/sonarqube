#!/bin/bash

cd /tmp || exit
echo "Downloading sonar-scanner....."
if [ -d "/tmp/sonar-scanner-cli-4.2.0.1873-linux.zip" ];then
    echo "delete current install zip"
    sudo rm /tmp/sonar-scanner-cli-4.2.0.1873-linux.zip
fi

if [ -d "/tmp/sonar-scanner-4.2.0.1873-linux" ];then
    echo "delete current install folder"
    sudo rm -r /tmp/sonar-scanner-4.2.0.1873-linux
fi

wget -q https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.2.0.1873-linux.zip
echo "Download completed."

echo "Unziping downloaded file..."
unzip /tmp/sonar-scanner-cli-4.2.0.1873-linux.zip
echo "Unzip completed."

echo "Installing to opt..."
if [ -d "/var/opt/sonar-scanner-4.2.0.1873-linux" ];then
    echo "delete sonar scanner in opt"
    sudo rm -rf /var/opt/sonar-scanner-4.2.0.1873-linux
fi

sudo mv /tmp/sonar-scanner-4.2.0.1873-linux /var/opt

echo "Installation completed successfully."
echo "You can use sonar-scanner! in /var/opt/sonar-scanner-4.2.0.1873-linux/bin/sonar-scanner"
sudo /var/opt/sonar-scanner-4.2.0.1873-linux/bin/sonar-scanner -v
