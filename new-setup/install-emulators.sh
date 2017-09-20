#!/bin/sh

# Emulators 

sudo pacman -S --noconfirm vice dosemu dosbox

yaourt -S --noconfirm fs-uae-devel fs-uae-launcher-devel aranym atari800 linapple-git hfsutils yaze 
yaourt -S --noconfirm basiliskii-git         
mkdir ~/.config/linapple
cp /usr/share/linapple/config/* ~/.config/linapple
