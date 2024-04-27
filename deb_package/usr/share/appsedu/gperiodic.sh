#!/bin/bash

apt update
apt install gperiodic -y

hadInstalled=$(apt list gperiodic | grep instal | wc -l)
if [ "$hadInstalled" == "1" ]; then
    sed -i '/NoDisplay=/c\NoDisplay=true' /usr/share/applications/gperiodic-installer.desktop
    sed -i '/Categories=/d' /usr/share/applications/gperiodic.desktop  
fi
