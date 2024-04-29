#!/bin/bash

wget "https://dl.google.com/dl/earth/client/current/google-earth-pro-stable_current_amd64.deb" \
-q --no-check-certificate --show-progress -O /root/google-earth-pro.deb

apt update
apt install /root/google-earth-pro.deb -y

hadInstalled=$(apt list google-earth-pro-stable | grep instal | wc -l)
if [ "$hadInstalled" == "1" ]; then
    sed -i '/NoDisplay=/c\NoDisplay=true' /usr/share/applications/google-earth-pro-installer.desktop
    sed -i '/Categories=/d' /usr/share/applications/google-earth-pro.desktop  
fi
