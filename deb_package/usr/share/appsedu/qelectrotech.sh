#!/bin/bash

wget -qO - "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x9daa4323eaa9f9e51432e0ab1cd61efb20d47986" | \
tee /etc/apt/trusted.gpg.d/qelectrotech.asc
echo "deb https://ppa.launchpadcontent.net/scorpio/qelectrotech-dev/ubuntu mantic main " | tee /etc/apt/sources.list.d/qelectrotech.list

apt update
apt install qelectrotech=0.100.0.r8082-2ubuntu4 -y

hadInstalled=$(apt list qelectrotech -a | grep instal | wc -l)
if [ "$hadInstalled" == "1" ]; then
    sed -i '/NoDisplay=/c\NoDisplay=true' /usr/share/applications/qelectrotech-installer.desktop
    sed -i '/Categories=/d' /usr/share/applications/qelectrotech.desktop  
fi
