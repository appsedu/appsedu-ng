#!/bin/bash

apt update
apt install solvespace -y

hadInstalled=$(apt list solvespace | grep instal | wc -l)
if [ "$hadInstalled" == "1" ]; then
    sed -i '/NoDisplay=/c\NoDisplay=true' /usr/share/applications/solvespace-installer.desktop
    sed -i '/Categories=/d' /usr/share/applications/solvespace.desktop  
fi
