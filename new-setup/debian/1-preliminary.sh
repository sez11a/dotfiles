#!/bin/bash

DIALOG=whiptail

sudo apt update -y 

#Dotfiles
sudo apt install -y stow

zip old-config-files.zip ~/.profile ~/.bash_profile ~/.bashrc ~/.bash_logout ~/.xprofile
rm ~/.profile ~/.bash_profile ~/.bashrc ~/.bash_logout ~/.xprofile
mv old-config-files.zip ~
cd ..
stow . 
cd new-setup
cp ./desktop/*.desktop ~/Desktop

# Set up for installation
sudo apt install -y festival festvox-us-slt-hts festvox-kallpc16k festvox-kdlpc16k rsync
function say { echo "$1" | festival --tts; }
export -f say

# Run an update before doing anything
sudo apt upgrade -y

# Install Flatpak
sudo apt install flatpak
