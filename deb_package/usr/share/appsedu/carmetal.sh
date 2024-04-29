#!/bin/bash

apt update
apt install carmetal -y

hadInstalled=$(apt list carmetal | grep instal | wc -l)
if [ "$hadInstalled" == "1" ]; then
    sed -i '/NoDisplay=/c\NoDisplay=true' /usr/share/applications/carmetal-installer.desktop
    sed -i '/Categories=/d' /usr/share/applications/carmetal.desktop  
fi
