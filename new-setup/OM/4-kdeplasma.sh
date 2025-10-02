#!/bin/bash

## Mouse cursors
sudo tar xvfz packages/oxygen-cursors-extra-6.2.3-1-any.pkg.tar.xz -C /
sudo rm /.BUILDINFO
sudo rm /.MTREE
sudo rm /.PKGINFO

# KDE Desktop Configuration
source common/configure-kdeplasma.sh

# KDE Apps
sudo dnf -y install bibletime plasma6-kcharselect kamoso digikam plasma6-falkon OpenColorIO kid3 plasma6-k3b
sudo dnf -y install task-plasma6-wayland
sudo dnf -y install neovim-qt

## Theme Stuff
sudo dnf -y install qt-theme-kvantum
