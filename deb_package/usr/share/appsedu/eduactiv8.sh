#!/bin/bash

curl -fsSL https://download.opensuse.org/repositories/home:imiolek-i/xUbuntu_25.04/Release.key | gpg --dearmor | tee /etc/apt/trusted.gpg.d/home_imiolek-i.gpg
echo 'deb http://download.opensuse.org/repositories/home:/imiolek-i/xUbuntu_25.04/ /' | tee /etc/apt/sources.list.d/home:imiolek-i.list
apt update
apt install eduactiv8 -y

hadInstalled=$(apt list eduactiv8 | grep instal | wc -l)
if [ "$hadInstalled" == "1" ]; then
    sed -i '/NoDisplay=/c\NoDisplay=true' /usr/share/applications/eduactiv8-installer.desktop
    sed -i '/Categories=/d' /usr/share/applications/eduactiv8.desktop  
fi
