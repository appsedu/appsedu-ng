#!/bin/bash

ORIGINAL="6cd2b8891df92d2cad8b6fdc47480fc089de085c4f3fe95eb80d5450a2a7f72d"
PATHDEB="$1"

HASH=$(sha256sum "$PATHDEB" | cut -d' ' -f1)
if [ $ORIGINAL != $HASH ]; then
    zenity --error --text="Você não selecionou um arquivo CiscoPacketTracer.deb válido! \nBaixe somente do site oficial!"
    exit
fi
 
apt update
echo debconf PacketTracer_822_amd64/accept-eula select true | debconf-set-selections
echo debconf PacketTracer_822_amd64/show-eula select false | debconf-set-selections
DEBIAN_FRONTEND=noninteractive apt install "$PATHDEB" -y

hadInstalled=$(apt list packettracer | grep instal | wc -l)
if [ "$hadInstalled" == "1" ]; then
    sed -i '/NoDisplay=/c\NoDisplay=true' /usr/share/applications/packet-tracer-installer.desktop
    sed -i '/Categories=/d' /usr/share/applications/cisco-pt821.desktop
fi
