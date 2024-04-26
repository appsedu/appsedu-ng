#!/bin/bash

apt update
apt install gperiodic -y

sed -i '/NoDisplay=/c\NoDisplay=true' /usr/share/applications/gperiodic-installer.desktop
sed -i '/Categories=/d' /usr/share/applications/gperiodic.desktop
