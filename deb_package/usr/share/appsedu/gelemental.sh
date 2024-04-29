#!/bin/bash

apt update
apt install gelemental -y

hadInstalled=$(apt list gelemental | grep instal | wc -l)
if [ "$hadInstalled" == "1" ]; then
    sed -i '/NoDisplay=/c\NoDisplay=true' /usr/share/applications/gelemental-installer.desktop
    sed -i '/Categories=/d' /usr/share/applications/gelemental.desktop  
fi
