#!/bin/bash

apt update
apt install kturtle -y

hadInstalled=$(apt list kturtle | grep instal | wc -l)
if [ "$hadInstalled" == "1" ]; then
    sed -i '/NoDisplay=/c\NoDisplay=true' /usr/share/applications/org.kde.kturtle-installer.desktop
    sed -i '/Categories=/d' /usr/share/applications/org.kde.kturtle.desktop  
fi
