#!/bin/bash

echo "Installing 3D Printing apps...."

sudo flatpak -y install OrcaSlicer PrusaSlicer OpenSCAD com.ultimaker.cura
sudo dnf -y install freecad

# After UM
# sudo dnf -y install platformio-core