#!/bin/bash

apt update
apt install python3-pycurl -y
apt install python3-future -y
apt install rhythmbox -y
apt install osdlyrics -y

hadInstalled=$(apt list osdlyrics | grep instal | wc -l)
if [ "$hadInstalled" == "1" ]; then
    sed -i '/NoDisplay=/c\NoDisplay=true' /usr/share/applications/osdlyrics-installer.desktop
    sed -i '/Categories=/d' /usr/share/applications/osdlyrics.desktop  
fi
