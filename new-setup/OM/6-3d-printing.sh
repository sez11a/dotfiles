#!/bin/bash

echo "Installing 3D Printing apps...." 

sudo flatpak -y install PrusaSlicer OpenSCAD com.ultimaker.cura
sudo dnf -qy install freecad
