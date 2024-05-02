#!/bin/bash

apt update
apt install eduactiv8 -y

hadInstalled=$(apt list eduactiv8 | grep instal | wc -l)
if [ "$hadInstalled" == "1" ]; then
    sed -i '/NoDisplay=/c\NoDisplay=true' /usr/share/applications/eduactiv8-installer.desktop
    sed -i '/Categories=/d' /usr/share/applications/eduactiv8.desktop  
fi
