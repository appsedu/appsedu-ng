#!/bin/bash

apt update
apt install klettres -y

hadInstalled=$(apt list klettres | grep instal | wc -l)
if [ "$hadInstalled" == "1" ]; then
    sed -i '/NoDisplay=/c\NoDisplay=true' /usr/share/applications/org.kde.klettres-installer.desktop
    sed -i '/Categories=/d' /usr/share/applications/org.kde.klettres.desktop  
fi
