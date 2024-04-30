#!/bin/bash

mkdir -p /usr/share/freecad/
wget "https://github.com/FreeCAD/FreeCAD/releases/download/0.21.2/FreeCAD-0.21.2-Linux-x86_64.AppImage" \
-q --no-check-certificate --show-progress -O /usr/share/freecad/FreeCAD.AppImage
chmod +x /usr/share/freecad/FreeCAD.AppImage

cat << EOF > /usr/bin/freecad
#!/bin/bash
LD_PRELOAD=/usr/lib/x86_64-linux-gnu/dri/vmwgfx_dri.so /usr/share/freecad/FreeCAD.AppImage
EOF
chmod +x /usr/bin/freecad
