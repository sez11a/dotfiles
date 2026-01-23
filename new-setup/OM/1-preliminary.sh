#!/bin/bash

## oh-my-posh
curl -s https://ohmyposh.dev/install.sh | bash -s

sudo enable-repo extra
sudo enable-repo restricted
sudo enable-repo non-free

# Configure DNF
echo -e "${NOTE} Adding extra spice in dnf.conf ... ${RESET}" 2>&1
echo "max_parallel_downloads=10" | sudo tee -a /etc/dnf/dnf.conf
echo -e "${CAT} dnf.conf spicing up completed ${RESET}" 2>&1

sudo dnf clean all ; dnf clean all ; sudo dnf distro-sync --refresh --allowerasing 2>&1| tee ~/dsync2-log.txt
sudo dnf --refresh -y install newt stow

DIALOG=whiptail

# Dotfiles
source common/dotfiles.sh
mkdir -p ~/.local/bin
cp OM/update.sh ~/.local/bin/update
# echo 'alias dsync="sudo dnf clean all ; dnf clean all ; sudo dnf distro-sync --refresh --allowerasing 2>&1| tee dsync2-log.txt ; flatpak update" # dnf updates for ROME' | tee -a ~/.profile

# Set up for installation
sudo dnf -y install festival
function say { echo "$1" | festival --tts; }
export -f say

# Install Flatpak
sudo dnf -y install flatpak
sudo dnf -y install flatdrake

# Install dnfdragora
# sudo dnf -y install dnfdragora