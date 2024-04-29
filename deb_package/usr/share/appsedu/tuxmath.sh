#!/bin/bash

apt update
apt install tuxmath -y

hadInstalled=$(apt list tuxmath | grep instal | wc -l)
if [ "$hadInstalled" == "1" ]; then
    sed -i '/NoDisplay=/c\NoDisplay=true' /usr/share/applications/tuxmath-installer.desktop
    sed -i '/Categories=/d' /usr/share/applications/tuxmath.desktop  
fi
