#!/bin/bash

wget "https://www.falstad.com/circuit/offline/circuitjs1-linux64.tgz" \
-q --no-check-certificate --show-progress -O /root/circuitjs1.tgz
tar -xf /root/circuitjs1.tgz -C /tmp/
mv /tmp/circuitjs1 /usr/share/circuitjs1
chown root:root /usr/share/circuitjs1/chrome-sandbox
chmod 4755 /usr/share/circuitjs1/chrome-sandbox
ln -s /usr/share/circuitjs1/circuitjs1 /usr/bin/circuitjs1
rm -rf /root/circuitjs1.tgz
