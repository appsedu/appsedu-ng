#!/bin/bash

apt update
apt install tuxtype -y

hadInstalled=$(apt list tuxtype | grep instal | wc -l)
if [ "$hadInstalled" == "1" ]; then
    sed -i '/NoDisplay=/c\NoDisplay=true' /usr/share/applications/tuxtype-installer.desktop
    sed -i '/Categories=/d' /usr/share/applications/tuxtype.desktop  
fi
