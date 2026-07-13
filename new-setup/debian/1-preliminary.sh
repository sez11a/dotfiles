#!/bin/bash

# Starship
sudo apt install -y starship stow

DIALOG=whiptail

sudo apt update -y

# Dotfiles
source common/dotfiles.sh

# Set up for installation
sudo apt install -y festival festvox-us-slt-hts festvox-kallpc16k festvox-kdlpc16k rsync
function say { echo "$1" | festival --tts; }
export -f say

# Run an update before doing anything
sudo apt upgrade -y

# May not do Flatpaks here; we have Snap
# Install Flatpak
# sudo apt install -y flatpak