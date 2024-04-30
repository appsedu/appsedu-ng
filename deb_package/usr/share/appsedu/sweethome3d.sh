#!/bin/bash

apt update

if [ -d /usr/lib/jvm/jdk-17-oracle-x64 ]; then
    ln -s /usr/lib/jvm/jdk-17-oracle-x64 /usr/lib/jvm/jdk-17
else
    apt install openjdk-17-jdk -y
fi

apt install sweethome3d -y
apt install sweethome3d-furniture-nonfree -y
apt install sweethome3d-furniture-editor -y
apt install sweethome3d-textures-editor -y

hadInstalled=$(apt list sweethome3d-textures-editor | grep instal | wc -l)
if [ "$hadInstalled" == "1" ]; then
    sed -i '/NoDisplay=/c\NoDisplay=true' /usr/share/applications/sweethome3d-installer.desktop
    sed -i '/Categories=/d' /usr/share/applications/sweethome3d.desktop
    sed -i '/Categories=/d' /usr/share/applications/sweethome3d-furniture-editor.desktop
    sed -i '/Categories=/d' /usr/share/applications/sweethome3d-textures-editor.desktop
fi
