#!/bin/bash

apt update
apt install easychem -y

hadInstalled=$(apt list easychem | grep instal | wc -l)
if [ "$hadInstalled" == "1" ]; then
    sed -i '/NoDisplay=/c\NoDisplay=true' /usr/share/applications/easychem-installer.desktop
    sed -i '/Categories=/d' /usr/share/applications/easychem.desktop  
fi
