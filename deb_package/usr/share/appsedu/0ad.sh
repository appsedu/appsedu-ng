#!/bin/bash

wget "http://archive.ubuntu.com/ubuntu/pool/universe/0/0ad/0ad_0.0.26-4_amd64.deb" \
-q --no-check-certificate --show-progress -O /root/0ad.deb
wget "http://archive.ubuntu.com/ubuntu/pool/main/i/icu/libicu72_72.1-3ubuntu3_amd64.deb" \
-q --no-check-certificate --show-progress -O /root/libicu72.deb

apt update
apt install /root/libicu72.deb -y
apt install /root/0ad.deb -y

hadInstalled=$(apt list 0ad | grep instal | wc -l)
if [ "$hadInstalled" == "1" ]; then
    sed -i '/NoDisplay=/c\NoDisplay=true' /usr/share/applications/0ad-installer.desktop
    sed -i '/Categories=/d' /usr/share/applications/0ad.desktop
    rm -rf /root/0ad.deb
    rm -rf /root/libicu72.deb
fi
