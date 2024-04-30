#!/bin/bash

apt update
apt install elements -y

hadInstalled=$(apt list elements | grep instal | wc -l)
if [ "$hadInstalled" == "1" ]; then
    sed -i '/NoDisplay=/c\NoDisplay=true' /usr/share/applications/elements-installer.desktop
    sed -i '/Categories=/d' /usr/share/applications/elements.desktop  
fi
