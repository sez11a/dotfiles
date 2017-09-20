#!/bin/sh

# Make XFCE handle the lid switch
xfconf-query -c xfce4-power-manager -p /xfce4-power-manager/logind-handle-lid-switch -s false

sudo pacman -S --noconfirm asunder

yaourt -S --noconfirm neovim-gtk3-git worker
