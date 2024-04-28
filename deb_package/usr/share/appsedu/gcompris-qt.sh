#!/bin/bash

apt update
apt install gcompris-qt -y

hadInstalled=$(apt list gcompris-qt | grep instal | wc -l)
if [ "$hadInstalled" == "1" ]; then
    sed -i '/NoDisplay=/c\NoDisplay=true' /usr/share/applications/org.kde.gcompris-installer.desktop
    sed -i '/Categories=/d' /usr/share/applications/org.kde.gcompris.desktop  
fi
