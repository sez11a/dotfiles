#!/bin/bash

sudo dnf -qy install kdepim

## Mouse cursors
sudo dnf -qy install oxygen-cursor-themes

## Theme Stuff
sudo dnf -qy install kvantum
sudo dnf -qy install dbusmenu-qt

# Need to find a way to get netspeed, plasmusic-toolbar 
sudo dnf -qy copr enable hazel-bunny/ricing
sudo dnf -qy install applet-window-buttons
sudo dnf -qy install applet-window-title
sudo dnf -qy install klassy
sudo dnf -qy install kora-icon-theme
sudo dnf -qy install fokus-plasmoid

cp -r ~/kora-icons/kora ~/.local/share/icons
cp -r ~/kora-icons/kora-light ~/.local/share/icons
cp -r ~/kora-icons/kora-light-panel ~/.local/share/icons
cp -r ~/kora-icons/kora-pgrey ~/.local/share/icons

# KDE Desktop Configuration
source common/configure-kdeplasma.sh
