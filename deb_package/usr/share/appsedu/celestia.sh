#!/bin/bash

source /etc/lsb-release
wget -qO - "https://download.opensuse.org/repositories/home:/munix9:/celestia:/1.7/xUbuntu_${DISTRIB_RELEASE}/Release.key" | tee /etc/apt/trusted.gpg.d/celestia.asc
echo "deb https://download.opensuse.org/repositories/home:/munix9:/celestia:/1.7/xUbuntu_${DISTRIB_RELEASE}/ ./" | sudo tee /etc/apt/sources.list.d/celestia-obs.list

apt update
apt install celestia -y

hadInstalled=$(apt list celestia | grep instal | wc -l)
if [ "$hadInstalled" == "1" ]; then
    sed -i '/NoDisplay=/c\NoDisplay=true' /usr/share/applications/celestia-installer.desktop
    sed -i '/Categories=/d' /usr/share/applications/space.celestiaproject.celestia_qt6.desktop
fi
