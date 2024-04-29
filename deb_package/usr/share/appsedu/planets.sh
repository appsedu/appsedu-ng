#!/bin/bash

apt update
apt install planets -y

hadInstalled=$(apt list planets | grep instal | wc -l)
if [ "$hadInstalled" == "1" ]; then
    sed -i '/NoDisplay=/c\NoDisplay=true' /usr/share/applications/planets-installer.desktop
    sed -i '/Categories=/d' /usr/share/applications/planets.desktop  
fi
