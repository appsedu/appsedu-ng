#!/bin/bash

apt update
apt install kgeography -y

sed -i '/NoDisplay=/c\NoDisplay=true' /usr/share/applications/kgeography-installer.desktop
sed -i '/Categories=/d' /usr/share/applications/org.kde.kgeography.desktop
