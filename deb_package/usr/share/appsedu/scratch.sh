#!/bin/bash

apt update
apt install scratch -y

hadInstalled=$(apt list scratch | grep instal | wc -l)
if [ "$hadInstalled" == "1" ]; then
    sed -i '/NoDisplay=/c\NoDisplay=true' /usr/share/applications/scratch-installer.desktop
    sed -i '/Categories=/d' /usr/share/applications/scratch.desktop  
fi
