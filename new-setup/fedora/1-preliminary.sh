#!/bin/bash

sudo dnf -qy install newt stow

DIALOG=whiptail

# Dotfiles

zip old-config-files.zip ~/.profile ~/.bash_profile ~/.bashrc ~/.bash_logout ~/.xprofile
rm ~/.profile ~/.bash_profile ~/.bashrc ~/.bash_logout ~/.xprofile
mv old-config-files.zip ~
cd ..
stow . 
cd new-setup
cp ./desktop/*.desktop ~/Desktop

# Set up for installation
sudo dnf -qy festival festival-data rsync
function say { echo "$1" | festival --tts; }
export -f say

# Install Flatpak
sudo dnf -qy flatpak
