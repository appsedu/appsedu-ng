#!/bin/bash

apt update
apt install kig -y

hadInstalled=$(apt list kig | grep instal | wc -l)
if [ "$hadInstalled" == "1" ]; then
    sed -i '/NoDisplay=/c\NoDisplay=true' /usr/share/applications/org.kde.kig-installer.desktop
    sed -i '/Categories=/d' /usr/share/applications/org.kde.kig.desktop  
fi
