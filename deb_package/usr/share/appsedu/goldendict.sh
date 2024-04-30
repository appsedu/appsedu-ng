#!/bin/bash

apt update
apt install goldendict-extras-pt -y

hadInstalled=$(apt list goldendict-extras-pt | grep instal | wc -l)
if [ "$hadInstalled" == "1" ]; then
    sed -i '/NoDisplay=/c\NoDisplay=true' /usr/share/applications/goldendict-installer.desktop
    sed -i '/Categories=/d' /usr/share/applications/org.goldendict.GoldenDict.desktop
fi
