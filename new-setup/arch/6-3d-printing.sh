#!/bin/bash

if [ "$ThreeDPrintingApps" = true ] ;then
  echo "Installing 3D Printing apps...." 

  sudo pacman -S --noconfirm superslicer prusa-slicer freecad openscad platformio-core platformio-core-udev
  yay -S --noconfirm cura-bin
  yay -S --noconfirm orca-slicer-bin
  yay -S --noconfirm ondsel-es-appimage

else 
  echo "Skipping 3D Printing Apps...." 
fi
