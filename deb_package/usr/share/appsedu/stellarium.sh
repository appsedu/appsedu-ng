#!/bin/bash

apt update
apt install stellarium -y

hadInstalled=$(apt list stellarium | grep instal | wc -l)
if [ "$hadInstalled" == "1" ]; then
    sed -i '/NoDisplay=/c\NoDisplay=true' /usr/share/applications/stellarium-installer.desktop
    sed -i '/Categories=/d' /usr/share/applications/org.stellarium.Stellarium.desktop  
fi
