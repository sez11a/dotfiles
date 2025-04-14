#!/bin/bash

sudo dnf -y install task-plasma6-wayland

## Mouse cursors
sudo tar xvfz packages/oxygen-cursors-extra-6.2.3-1-any.pkg.tar.xz -C /
sudo rm /.BUILDINFO
sudo rm /.MTREE
sudo rm /.PKGINFO

## Theme Stuff
sudo dnf -y install qt-theme-kvantum

# KDE Desktop Configuration
source common/configure-kdeplasma.sh
