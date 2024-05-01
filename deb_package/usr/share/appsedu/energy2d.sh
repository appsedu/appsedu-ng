#!/bin/bash

apt update
apt install energy2d -y

hadInstalled=$(apt list energy2d | grep instal | wc -l)
if [ "$hadInstalled" == "1" ]; then
    sed -i '/NoDisplay=/c\NoDisplay=true' /usr/share/applications/org.concord.energy.energy2d-installer.desktop
    sed -i '/Categories=/d' /usr/share/applications/org.concord.energy.energy2d.desktop  
fi
