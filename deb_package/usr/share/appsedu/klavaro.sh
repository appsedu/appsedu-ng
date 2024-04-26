#!/bin/bash

apt update
apt install klavaro -y

sed -i '/NoDisplay=/c\NoDisplay=true' /usr/share/applications/klavaro-installer.desktop
sed -i '/Categories=/d' /usr/share/applications/klavaro.desktop
