#!/bin/bash

apt update
apt install kgeography -y

hadInstalled=$(apt list kgeography | grep instal | wc -l)
if [ "$hadInstalled" == "1" ]; then
    sed -i '/NoDisplay=/c\NoDisplay=true' /usr/share/applications/kgeography-installer.desktop
    sed -i '/Categories=/d' /usr/share/applications/org.kde.kgeography.desktop    
fi
