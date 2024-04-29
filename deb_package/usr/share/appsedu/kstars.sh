#!/bin/bash

apt update
apt install kstars -y

hadInstalled=$(apt list kstars | grep instal | wc -l)
if [ "$hadInstalled" == "1" ]; then
    sed -i '/NoDisplay=/c\NoDisplay=true' /usr/share/applications/org.kde.kstars-installer.desktop
    sed -i '/Categories=/d' /usr/share/applications/org.kde.kstars.desktop  
fi
