#!/bin/bash

wget "https://downloads.arduino.cc/arduino-ide/arduino-ide_2.3.10_Linux_64bit.zip" \
-q --show-progress --inet4-only -O /root/arduino-ide.zip
unzip /root/arduino-ide.zip -d /tmp/arduino-ide/
mv /tmp/arduino-ide/arduino-ide_*_Linux_64bit /usr/share/arduino-ide
chown root:root /usr/share/arduino-ide/chrome-sandbox
chmod 4755 /usr/share/arduino-ide/chrome-sandbox
ln -sf /usr/share/arduino-ide/arduino-ide /usr/bin/arduino-ide
rm -rf /root/arduino-ide.zip
rm -rf /tmp/arduino-ide
