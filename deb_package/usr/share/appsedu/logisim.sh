#!/bin/bash

apt update
apt install logisim -y

sed -i '/NoDisplay=/c\NoDisplay=true' /usr/share/applications/logisim-installer.desktop
sed -i '/Categories=/d' /usr/share/applications/logisim.desktop
