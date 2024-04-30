#!/bin/bash

apt update
apt install gcad3d -y

hadInstalled=$(apt list gcad3d | grep instal | wc -l)
if [ "$hadInstalled" == "1" ]; then
    sed -i '/NoDisplay=/c\NoDisplay=true' /usr/share/applications/gcad3d-installer.desktop
    sed -i '/Categories=/d' /usr/share/applications/gcad3d.desktop  
fi
