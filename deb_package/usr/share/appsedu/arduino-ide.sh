#!/bin/bash

wget "https://downloads.arduino.cc/arduino-ide/arduino-ide_2.3.2_Linux_64bit.zip" \
-q --no-check-certificate --show-progress -O /root/arduino-ide.zip
unzip /root/arduino-ide.zip -d /tmp/
mv /tmp/arduino-ide_2.3.2_Linux_64bit /usr/share/arduino-ide
chown root:root /usr/share/arduino-ide/chrome-sandbox
chmod 4755 /usr/share/arduino-ide/chrome-sandbox
ln -s /usr/share/arduino-ide/arduino-ide /usr/bin/arduino-ide
rm -rf /root/arduino-ide.zip
