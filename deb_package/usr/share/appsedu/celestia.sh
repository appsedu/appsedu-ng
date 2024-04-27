#!/bin/bash

wget -qO - https://celestiaproject.space/celestiaproject.key | tee /etc/apt/trusted.gpg.d/celestia.asc
echo "deb https://celestiaproject.space/ubuntu/ jammy main" | tee /etc/apt/sources.list.d/celestia.list
apt update
apt install celestia -y

hadInstalled=$(apt list celestia | grep instal | wc -l)
if [ "$hadInstalled" == "1" ]; then
    sed -i '/NoDisplay=/c\NoDisplay=true' /usr/share/applications/celestia-installer.desktop
    sed -i '/Categories=/d' /usr/share/applications/celestia-gtk.desktop
fi
