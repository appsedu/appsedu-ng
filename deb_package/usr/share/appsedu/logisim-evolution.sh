#!/bin/bash

wget "https://github.com/logisim-evolution/logisim-evolution/releases/download/v3.8.0/logisim-evolution_3.8.0-1_amd64.deb" \
-q --no-check-certificate --show-progress -O /root/logisim-evolution.deb

apt update
apt install /root/logisim-evolution.deb -y

sed -i '/NoDisplay=/c\NoDisplay=true' /usr/share/applications/logisim-evolution-installer.desktop
sed -i '/Categories=/d' /usr/share/applications/logisim-evolution-logisim-evolution.desktop

rm -rf /root/logisim-evolution.deb
