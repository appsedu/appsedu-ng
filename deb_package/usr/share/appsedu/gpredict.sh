#!/bin/bash

apt update
apt install gpredict -y

hadInstalled=$(apt list gpredict | grep instal | wc -l)
if [ "$hadInstalled" == "1" ]; then
    sed -i '/NoDisplay=/c\NoDisplay=true' /usr/share/applications/gpredict-installer.desktop
    sed -i '/Categories=/d' /usr/share/applications/gpredict.desktop  
fi
