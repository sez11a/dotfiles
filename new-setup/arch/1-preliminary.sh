#!/bin/bash

# Build Stuff is needed to build AUR packages
sudo pacman -S --noconfirm bash-completion libnewt base-devel

DIALOG=whiptail

sudo pacman -S --noconfirm stow

# Dotfiles

zip old-config-files.zip ~/.profile ~/.bash_profile ~/.bashrc ~/.bash_logout ~/.xprofile
rm ~/.profile ~/.bash_profile ~/.bashrc ~/.bash_logout ~/.xprofile
mv old-config-files.zip ~
cd ..
stow . 
cd new-setup
cp ./desktop/*.desktop ~/Desktop

# Set up for installation
sudo pacman -S --noconfirm festival festival-english festival-us rsync
function say { echo "$1" | festival --tts; }
export -f say

# AUR Helper
# If on Arch, install this before running this script. On Manjaro and EndeavourOS, 
# it's in the repo, so we can just call the installer and get it.

if $_ismanjaro; then
  sudo pacman -S --noconfirm yay
else
  sudo pacman -S --noconfirm go
  printf "\n%s - Installing yay from AUR\n" "${NOTE}"
  git clone https://aur.archlinux.org/yay.git ~/Downloads/yay || { printf "%s - Failed to clone yay from AUR\n" "${ERROR}"; exit 1; }
  cd ~/Downloads/yay || { printf "%s - Failed to enter yay directory\n" "${ERROR}"; exit 1; }
  makepkg -si --noconfirm 2>&1 || { printf "%s - Failed to install yay from AUR\n" "${ERROR}"; exit 1; }
  cd $_rundir
fi

# Configure Pacman
echo -e "${NOTE} Adding Extra Spice in pacman.conf ... ${RESET}" 2>&1 
pacman_conf="/etc/pacman.conf"

# Remove comments '#' from specific lines
lines_to_edit=(
    "Color"
    "CheckSpace"
    "VerbosePkgLists"
    "ParallelDownloads"
)

# Uncomment specified lines if they are commented out
for line in "${lines_to_edit[@]}"; do
    if grep -q "^#$line" "$pacman_conf"; then
        sudo sed -i "s/^#$line/$line/" "$pacman_conf"
        echo -e "${CAT} Uncommented: $line ${RESET}" 2>&1 
    else
        echo -e "${CAT} $line is already uncommented. ${RESET}" 2>&1 
    fi
done

# Add "ILoveCandy" below ParallelDownloads if it doesn't exist
if grep -q "^ParallelDownloads" "$pacman_conf" && ! grep -q "^ILoveCandy" "$pacman_conf"; then
    sudo sed -i "/^ParallelDownloads/a ILoveCandy" "$pacman_conf"
    echo -e "${CAT} Added ILoveCandy below ParallelDownloads. ${RESET}" 2>&1 
else
    echo -e "${CAT} ILoveCandy already exists ${RESET}" 2>&1 
fi

echo -e "${CAT} Pacman.conf spicing up completed ${RESET}" 2>&1 

# On Manjaro, run pacman-mirrors. Otherwise, set up Reflector.
if $_ismanjaro; then
  sudo pacman-mirrors -f 0
else 
  sudo pacman -S --noconfirm reflector 
  sudo mv /etc/xdg/reflector/reflector.conf /etc/xdg/reflector/reflector.conf.orig
  sudo cp ./conf/reflector.conf /etc/xdg/reflector
  sudo systemctl start reflector.service
  sudo systemctl enable reflector.timer
fi

# Now we should be using the fastest mirrors; run an update before doing anything
sudo pacman -Syu --noconfirm

# Improve AUR Performance
# Install the multicore compression utilities.
# Rename makepkg.conf and replace it with the multicore version.

sudo pacman -S --noconfirm pbzip2 pigz lbzip2 lrzip
sudo mv /etc/makepkg.conf /etc/makepkg.conf.orig
sudo cp conf/makepkg.conf /etc/makepkg.conf

