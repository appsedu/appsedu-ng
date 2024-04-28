#!/bin/bash

apt update
apt install step -y

hadInstalled=$(apt list step | grep instal | wc -l)
if [ "$hadInstalled" == "1" ]; then
    sed -i '/NoDisplay=/c\NoDisplay=true' /usr/share/applications/org.kde.step-installer.desktop
    sed -i '/Categories=/d' /usr/share/applications/org.kde.step.desktop  
fi
