#!/bin/bash

apt update
apt install geogebra-classic -y

chmod 4755 /usr/share/geogebra-classic/chrome-sandbox

hadInstalled=$(apt list geogebra-classic | grep instal | wc -l)
if [ "$hadInstalled" == "1" ]; then
    sed -i '/NoDisplay=/c\NoDisplay=true' /usr/share/applications/geogebra-classic-installer.desktop
    sed -i '/Categories=/d' /usr/share/applications/geogebra-classic.desktop  
fi
