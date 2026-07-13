#!/bin/bash

echo "Installing 3D Printing apps...."

snap install orcaslicer cura-slicer freecad
sudo apt install -y openscad

curl -fsSL -o get-platformio.py https://raw.githubusercontent.com/platformio/platformio-core-installer/master/get-platformio.py
python3 get-platformio.py