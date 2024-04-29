#!/bin/bash

apt update
apt install chemtool -y

hadInstalled=$(apt list chemtool | grep instal | wc -l)
if [ "$hadInstalled" == "1" ]; then
    sed -i '/NoDisplay=/c\NoDisplay=true' /usr/share/applications/chemtool-installer.desktop
    sed -i '/Categories=/d' /usr/share/applications/chemtool.desktop  
fi
