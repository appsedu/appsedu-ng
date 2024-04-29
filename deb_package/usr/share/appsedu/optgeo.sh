#!/bin/bash

apt update
apt install optgeo -y

hadInstalled=$(apt list optgeo | grep instal | wc -l)
if [ "$hadInstalled" == "1" ]; then
    sed -i '/NoDisplay=/c\NoDisplay=true' /usr/share/applications/optgeo-installer.desktop
    sed -i '/Categories=/d' /usr/share/applications/optgeo.desktop  
fi
