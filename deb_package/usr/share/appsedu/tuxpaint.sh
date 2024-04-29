#!/bin/bash

apt update
apt install tuxpaint -y

hadInstalled=$(apt list tuxpaint | grep instal | wc -l)
if [ "$hadInstalled" == "1" ]; then
    sed -i '/NoDisplay=/c\NoDisplay=true' /usr/share/applications/tuxpaint-installer.desktop
    sed -i '/Categories=/d' /usr/share/applications/tuxpaint.desktop  
fi
