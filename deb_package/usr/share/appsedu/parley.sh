#!/bin/bash

apt update
apt install parley -y

hadInstalled=$(apt list parley | grep instal | wc -l)
if [ "$hadInstalled" == "1" ]; then
    sed -i '/NoDisplay=/c\NoDisplay=true' /usr/share/applications/org.kde.parley-installer.desktop
    sed -i '/Categories=/d' /usr/share/applications/org.kde.parley.desktop  
fi
