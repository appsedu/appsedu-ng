#!/bin/bash
#
# HOW TO USE:
#
# ./generate-installer.sh gconjugue GConjugue

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

echo "Generating binary..."
cat << EOF > deb_package/usr/bin/$appName-installer
#!/bin/bash

pkexec /usr/share/appsedu/$appName.sh 2>&1 >/dev/null | \\
zenity --progress --pulsate --no-cancel --auto-close --title="$appCanonicalName" --width=450 \\
--text="Espere um pouco. Estamos instalando o app..."

$appName
EOF

sudo chmod +x deb_package/usr/bin/$appName-installer

echo "Generating installer..."
cat << EOF > deb_package/usr/share/appsedu/$appName.sh
#!/bin/bash

apt update
apt install $appName -y

hadInstalled=\$(apt list $appName | grep instal | wc -l)
if [ "\$hadInstalled" == "1" ]; then
    sed -i '/NoDisplay=/c\NoDisplay=true' /usr/share/applications/$appName-installer.desktop
    sed -i '/Categories=/d' /usr/share/applications/$appName.desktop  
fi
EOF

sudo chmod +x deb_package/usr/share/appsedu/$appName.sh

echo "Generating policy..."
cat << EOF > deb_package/usr/share/polkit-1/actions/io.github.appsedu.$appName.policy
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE policyconfig PUBLIC "-//freedesktop//DTD PolicyKit Policy Configuration 1.0//EN" "http://www.freedesktop.org/standards/PolicyKit/1/policyconfig.dtd">
<policyconfig>
    <action id="io.github.appsedu.$appName.pkexec">
        <description>Install $appCanonicalName</description>
        <message>Authentication is required to run the superuser</message>
        <icon_name></icon_name>
        <defaults>
            <allow_any>yes</allow_any>
            <allow_inactive>yes</allow_inactive>
            <allow_active>yes</allow_active>
        </defaults>
        <annotate key="org.freedesktop.policykit.exec.path">/usr/share/appsedu/$appName.sh</annotate>
        <annotate key="org.freedesktop.policykit.exec.allow_gui">true</annotate>
    </action>
</policyconfig>
EOF
