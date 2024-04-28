#!/bin/bash

apt update
apt install kirigami-addons-dev qml-module-qt-labs-platform -y
apt install kwordquiz -y

hadInstalled=$(apt list kwordquiz | grep instal | wc -l)
if [ "$hadInstalled" == "1" ]; then
    sed -i '/NoDisplay=/c\NoDisplay=true' /usr/share/applications/org.kde.kwordquiz-installer.desktop
    sed -i '/Categories=/d' /usr/share/applications/org.kde.kwordquiz.desktop  
fi
