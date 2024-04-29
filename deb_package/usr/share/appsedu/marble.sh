#!/bin/bash

apt update
apt install marble-maps -y
apt install marble -y

hadInstalled=$(apt list marble | grep instal | wc -l)
if [ "$hadInstalled" == "1" ]; then
    sed -i '/NoDisplay=/c\NoDisplay=true' /usr/share/applications/org.kde.marble-installer.desktop
    sed -i '/Categories=/d' /usr/share/applications/org.kde.marble.desktop
    sed -i '/Categories=/d' /usr/share/applications/org.kde.marble.maps.desktop     
fi
