#!/bin/bash
#
# HOW TO USE:
#
# ./generate-installer.sh avogadro avogadro "Avogadro"

canonicalName=$1
pkgName=$2
humanName=$3

echo "Generating launcher..."
cat << EOF > deb_package/usr/share/applications/$canonicalName-installer.desktop
[Desktop Entry]
Name=$humanName
Exec=/usr/bin/$pkgName-installer
Icon=$pkgName-installer
Terminal=false
Type=Application
StartupNotify=true
NoDisplay=false
EOF

echo "Generating binary..."
cat << EOF > deb_package/usr/bin/$pkgName-installer
#!/bin/bash

pkexec /usr/share/appsedu/$pkgName.sh 2>&1 >/dev/null | \\
zenity --progress --pulsate --no-cancel --auto-close --title="$humanName" --width=450 \\
--text="Espere um pouco. Estamos instalando o app..."

$pkgName
EOF

sudo chmod +x deb_package/usr/bin/$pkgName-installer

echo "Generating installer..."
cat << EOF > deb_package/usr/share/appsedu/$pkgName.sh
#!/bin/bash

apt update
apt install $pkgName -y

hadInstalled=\$(apt list $pkgName | grep instal | wc -l)
if [ "\$hadInstalled" == "1" ]; then
    sed -i '/NoDisplay=/c\NoDisplay=true' /usr/share/applications/$canonicalName-installer.desktop
    sed -i '/Categories=/d' /usr/share/applications/$canonicalName.desktop  
fi
EOF

sudo chmod +x deb_package/usr/share/appsedu/$pkgName.sh

echo "Generating policy..."
cat << EOF > deb_package/usr/share/polkit-1/actions/io.github.appsedu.$pkgName.policy
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE policyconfig PUBLIC "-//freedesktop//DTD PolicyKit Policy Configuration 1.0//EN" "http://www.freedesktop.org/standards/PolicyKit/1/policyconfig.dtd">
<policyconfig>
    <action id="io.github.appsedu.$pkgName.pkexec">
        <description>Install $humanName</description>
        <message>Authentication is required to run the superuser</message>
        <icon_name></icon_name>
        <defaults>
            <allow_any>yes</allow_any>
            <allow_inactive>yes</allow_inactive>
            <allow_active>yes</allow_active>
        </defaults>
        <annotate key="org.freedesktop.policykit.exec.path">/usr/share/appsedu/$pkgName.sh</annotate>
        <annotate key="org.freedesktop.policykit.exec.allow_gui">true</annotate>
    </action>
</policyconfig>
EOF
