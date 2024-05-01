#!/bin/bash

apt update
apt install opticalraytracer -y

hadInstalled=$(apt list opticalraytracer | grep instal | wc -l)
if [ "$hadInstalled" == "1" ]; then
    sed -i '/NoDisplay=/c\NoDisplay=true' /usr/share/applications/opticalraytracer-installer.desktop
    sed -i '/Categories=/d' /usr/share/applications/opticalraytracer.desktop  
fi
