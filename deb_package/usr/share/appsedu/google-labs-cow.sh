#!/bin/bash

apt update
apt install google-labs-cow -y

hadInstalled=$(apt list google-labs-cow | grep instal | wc -l)
if [ "$hadInstalled" == "1" ]; then
    sed -i '/NoDisplay=/c\NoDisplay=true' /usr/share/applications/com.google.code.open3dviewer-cow-installer.desktop
    sed -i '/Categories=/d' /usr/share/applications/com.google.code.open3dviewer-cow.desktop  
fi
