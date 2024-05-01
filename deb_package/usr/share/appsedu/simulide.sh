#!/bin/bash

wget "https://launchpad.net/simulide/1.1.0/1.1.0-sr0/+download/SimulIDE_1.1.0-SR0_Lin64.tar.gz" \
-q --no-check-certificate --show-progress -O /root/simulide.tar.gz
tar -xf /root/simulide.tar.gz -C /tmp/
mv /tmp/SimulIDE_1.1.0-SR0_Lin64 /usr/share/simulide_sr0
ln -s /usr/share/simulide_sr0/simulide /usr/bin/simulide_sr0
rm -rf /root/simulide.tar.gz
