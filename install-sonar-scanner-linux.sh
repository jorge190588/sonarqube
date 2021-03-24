#!/bin/bash

cd /tmp || exit
echo "Downloading sonar-scanner....."
if [ -d "/tmp/sonar-scanner-cli-4.2.0.1873-linux.zip" ];then
    sudo rm /tmp/sonar-scanner-cli-4.2.0.1873-linux.zip
fi
wget -q https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.2.0.1873-linux.zip
echo "Download completed."

echo "Unziping downloaded file..."
unzip sonar-scanner-cli-4.2.0.1873-linux.zip
echo "Unzip completed."
rm ssonar-scanner-cli-4.2.0.1873-linux.zip

echo "Installing to opt..."
if [ -d "/var/opt/sonar-scanner-cli-4.2.0.1873-linux" ];then
    sudo rm -rf /var/opt/sonar-scanner-cli-4.2.0.1873-linux
fi
sudo mv sonar-scanner-cli-4.2.0.1873-linux /var/opt

echo "Installation completed successfully."

echo "You can use sonar-scanner!"
