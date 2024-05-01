#!/bin/bash

apt update
apt install gresistor-extras-pt -y

hadInstalled=$(apt list gresistor-extras-pt | grep instal | wc -l)
if [ "$hadInstalled" == "1" ]; then
    sed -i '/NoDisplay=/c\NoDisplay=true' /usr/share/applications/gresistor-installer.desktop
    sed -i '/Categories=/d' /usr/share/applications/gresistor.desktop  
fi
