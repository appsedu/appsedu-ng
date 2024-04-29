#!/bin/bash

apt update
apt install kmplot -y

hadInstalled=$(apt list kmplot | grep instal | wc -l)
if [ "$hadInstalled" == "1" ]; then
    sed -i '/NoDisplay=/c\NoDisplay=true' /usr/share/applications/org.kde.kmplot-installer.desktop
    sed -i '/Categories=/d' /usr/share/applications/org.kde.kmplot.desktop  
fi
