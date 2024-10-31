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

## Starship prevents git prompt error on Fedora
sudo dnf -qy copr enable shdwchn10/AllTheTools
sudo dnf -qy install starship 

# Set up for installation
sudo dnf -qy install festival festival-data rsync
function say { echo "$1" | festival --tts; }
export -f say

# Install Flatpak
sudo dnf -qy install flatpak

# Enable RPM Fusion
sudo dnf -qy install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf qy install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

## Enable Brave
sudo dnf -qy install dnf-plugins-core
sudo dnf -qy config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo
sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
sudo dnf -qy install brave-browser

# Configure DNF 
echo -e "${NOTE} Adding extra spice in dnf.conf ... ${RESET}" 2>&1
echo "max_parallel_downloads=10" | sudo tee -a /etc/dnf/dnf.conf
echo -e "${CAT} dnf.conf spicing up completed ${RESET}" 2>&1

sudo dnf -qy update

# Install dnfdragora
sudo dnf -qy install dnfdragora

# Install Multimedia codecs
sudo dnf -qy install gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel

sudo dnf -qy install lame\* --exclude=lame-devel

sudo dnf -qy group upgrade --with-optional Multimedia
