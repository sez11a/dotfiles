#!/bin/bash

## Mouse cursors
sudo tar xvf packages/oxygen-cursors-extra-6.2.3-1-any.pkg.tar.xz -C /
sudo rm /.BUILDINFO
sudo rm /.MTREE
sudo rm /.PKGINFO

# KDE Desktop Configuration
source common/configure-kdeplasma.sh

# KDE Apps
sudo apt install -y kdepim
sudo apt install -y kio-gdrive neovim-qt yakuake gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-qt6 krusader kdenlive bibletime kamoso ktorrent digikam kleopatra falkon kid3 k3b qt-style-kvantum