#!/bin/bash

apt update
apt install kbruch -y

hadInstalled=$(apt list kbruch | grep instal | wc -l)
if [ "$hadInstalled" == "1" ]; then
    sed -i '/NoDisplay=/c\NoDisplay=true' /usr/share/applications/org.kde.kbruch-installer.desktop
    sed -i '/Categories=/d' /usr/share/applications/org.kde.kbruch.desktop  
fi
