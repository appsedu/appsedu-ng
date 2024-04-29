#!/bin/bash

apt update
apt install khangman -y

hadInstalled=$(apt list khangman | grep instal | wc -l)
if [ "$hadInstalled" == "1" ]; then
    sed -i '/NoDisplay=/c\NoDisplay=true' /usr/share/applications/org.kde.khangman-installer.desktop
    sed -i '/Categories=/d' /usr/share/applications/org.kde.khangman.desktop  
fi
