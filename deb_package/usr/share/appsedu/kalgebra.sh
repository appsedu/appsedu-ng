#!/bin/bash

apt update
apt install kalgebra -y

hadInstalled=$(apt list kalgebra | grep instal | wc -l)
if [ "$hadInstalled" == "1" ]; then
    sed -i '/NoDisplay=/c\NoDisplay=true' /usr/share/applications/kalgebra-installer.desktop
    sed -i '/Categories=/d' /usr/share/applications/org.kde.kalgebra.desktop
fi
