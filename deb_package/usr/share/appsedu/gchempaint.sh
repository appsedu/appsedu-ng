#!/bin/bash

apt update
apt install gcu-bin -y
apt install gchempaint -y

hadInstalled=$(apt list gchempaint | grep instal | wc -l)
if [ "$hadInstalled" == "1" ]; then
    sed -i '/NoDisplay=/c\NoDisplay=true' /usr/share/applications/gchempaint-installer.desktop
    sed -i '/Categories=/d' /usr/share/applications/gchempaint-0.14.desktop
    sed -i '/Categories=/d' /usr/share/applications/gchem3d-0.14.desktop
    sed -i '/Categories=/d' /usr/share/applications/gchemcalc-0.14.desktop
    sed -i '/Categories=/d' /usr/share/applications/gchemtable-0.14.desktop
    sed -i '/Categories=/d' /usr/share/applications/gspectrum-0.14.desktop
fi
