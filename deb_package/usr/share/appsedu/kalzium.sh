#!/bin/bash

apt update
apt install kalzium -y

hadInstalled=$(apt list kalzium | grep instal | wc -l)
if [ "$hadInstalled" == "1" ]; then
    sed -i '/NoDisplay=/c\NoDisplay=true' /usr/share/applications/org.kde.kalzium-installer.desktop
    sed -i '/Categories=/d' /usr/share/applications/org.kde.kalzium.desktop  
fi
