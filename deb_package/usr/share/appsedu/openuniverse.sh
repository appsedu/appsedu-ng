#!/bin/bash

apt update
apt install openuniverse -y

hadInstalled=$(apt list openuniverse | grep instal | wc -l)
if [ "$hadInstalled" == "1" ]; then
    sed -i '/NoDisplay=/c\NoDisplay=true' /usr/share/applications/openuniverse-installer.desktop
    sed -i '/Categories=/d' /usr/share/applications/openuniverse.desktop  
fi
