#!/bin/bash

apt update
apt install logisim -y

hadInstalled=$(apt list logisim | grep instal | wc -l)
if [ "$hadInstalled" == "1" ]; then
    sed -i '/NoDisplay=/c\NoDisplay=true' /usr/share/applications/logisim-installer.desktop
    sed -i '/Categories=/d' /usr/share/applications/logisim.desktop    
fi
