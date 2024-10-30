#!/bin/bash


if [ "$ThreeDPrintingApps" = true ] ;then
  echo "Installing 3D Printing apps...." 

  sudo dnf -qy install prusa-slicer openscad platformio cura 
  sudo dnf -qy copr enable kkleine/freecad-latest
  sudo dnf -qy install freecad

else 
  echo "Skipping 3D Printing Apps...."
fi
