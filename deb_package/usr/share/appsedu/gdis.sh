#!/bin/bash

apt update
apt install gdis -y

hadInstalled=$(apt list gdis | grep instal | wc -l)
if [ "$hadInstalled" == "1" ]; then
    sed -i '/NoDisplay=/c\NoDisplay=true' /usr/share/applications/gdis-installer.desktop
    sed -i '/Categories=/d' /usr/share/applications/gdis.desktop
    sed -i 's/Icon=gdis/Icon=gdis-installer/g' /usr/share/applications/gdis.desktop  
fi
