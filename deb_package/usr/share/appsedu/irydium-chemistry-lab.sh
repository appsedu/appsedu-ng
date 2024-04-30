#!/bin/bash

apt update
apt install irydium-chemistry-lab -y

hadInstalled=$(apt list irydium-chemistry-lab | grep instal | wc -l)
if [ "$hadInstalled" == "1" ]; then
    sed -i '/NoDisplay=/c\NoDisplay=true' /usr/share/applications/irydium-chemistry-lab-installer.desktop
    sed -i '/Categories=/d' /usr/share/applications/irydium-chemistry-lab.desktop  
fi
