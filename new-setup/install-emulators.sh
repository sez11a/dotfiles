#!/bin/sh

# Emulators 

sudo pacman -S --noconfirm vice dosemu dosbox

yay -S --noconfirm fs-uae fs-uae-launcher aranym atari800 hfsutils yaze 
yay -S --noconfirm basiliskii-git         
yay -S --noconfirm linapple-git
mkdir ~/.config/linapple
cp /usr/share/linapple/config/* ~/.config/linapple
