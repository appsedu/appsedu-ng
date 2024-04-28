#!/bin/bash

apt update
apt install gconjugue -y

hadInstalled=$(apt list gconjugue | grep instal | wc -l)
if [ "$hadInstalled" == "1" ]; then
    sed -i '/NoDisplay=/c\NoDisplay=true' /usr/share/applications/gconjugue-installer.desktop
    sed -i '/Categories=/d' /usr/share/applications/gconjugue.desktop  
fi
