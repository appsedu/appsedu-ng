#!/bin/bash

apt update
apt install ktouch -y

hadInstalled=$(apt list ktouch | grep instal | wc -l)
if [ "$hadInstalled" == "1" ]; then
    sed -i '/NoDisplay=/c\NoDisplay=true' /usr/share/applications/org.kde.ktouch-installer.desktop
    sed -i '/Categories=/d' /usr/share/applications/org.kde.ktouch.desktop  
fi
