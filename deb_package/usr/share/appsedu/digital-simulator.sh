#!/bin/bash

apt update
apt install digital-simulator -y

hadInstalled=$(apt list digital-simulator | grep instal | wc -l)
if [ "$hadInstalled" == "1" ]; then
    sed -i '/NoDisplay=/c\NoDisplay=true' /usr/share/applications/digital-simulator-installer.desktop
    sed -i '/Categories=/d' /usr/share/applications/digital-simulator.desktop  
fi
