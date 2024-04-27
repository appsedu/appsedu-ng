#!/bin/bash

appName=$1
appCanonicalName=$2

echo "Generating launcher..."
cat << EOF > deb_package/usr/share/applications/$appName-installer.desktop
[Desktop Entry]
Name=$appCanonicalName
Exec=/usr/bin/$appName-installer
Icon=$appName-installer
Terminal=false
Type=Application
StartupNotify=true
NoDisplay=false

EOF

# ./generate-installer.sh qelectrotech QElectroTech