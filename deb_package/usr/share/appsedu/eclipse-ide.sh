#!/bin/bash

tar -xf /tmp/eclipse-ide.tar.gz -C /tmp/
rm -rf /usr/share/eclipse-ide
cp -r /tmp/eclipse /usr/share/eclipse-ide
ln -s /usr/share/eclipse-ide/eclipse /usr/bin/eclipse-ide
