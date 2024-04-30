#!/bin/bash

apt update
apt install librecad -y

hadInstalled=$(apt list librecad | grep instal | wc -l)
if [ "$hadInstalled" == "1" ]; then
    sed -i '/NoDisplay=/c\NoDisplay=true' /usr/share/applications/librecad-installer.desktop
    sed -i '/Categories=/d' /usr/share/applications/librecad.desktop  
fi
