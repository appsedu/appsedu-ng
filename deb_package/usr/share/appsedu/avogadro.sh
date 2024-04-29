#!/bin/bash

apt update
apt install avogadro -y

hadInstalled=$(apt list avogadro | grep instal | wc -l)
if [ "$hadInstalled" == "1" ]; then
    sed -i '/NoDisplay=/c\NoDisplay=true' /usr/share/applications/avogadro-installer.desktop
    sed -i '/Categories=/d' /usr/share/applications/avogadro2.desktop  
fi
