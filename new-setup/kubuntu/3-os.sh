#!/bin/bash

# Startup sound
source common/startup-sound.sh

# MOTD
sudo bash -c $'echo "fastfetch" >> /etc/profile.d/mymotd.sh && chmod +x /etc/profile.d/mymotd.sh'

# Editor
sudo apt install -y neovim xsel wl-clipboard ripgrep jq
curl -sLf https://raw.githubusercontent.com/sez11a/VimStar/master/install-vimstar.sh | bash

sudo apt install -y alsa-utils

# Syncthing
sudo mkdir -p /etc/apt/keyrings
sudo curl -L -o /etc/apt/keyrings/syncthing-archive-keyring.gpg https://syncthing.net/release-key.gpg
echo "deb [signed-by=/etc/apt/keyrings/syncthing-archive-keyring.gpg] https://apt.syncthing.net/ syncthing stable-v2" | sudo tee /etc/apt/sources.list.d/syncthing.list
sudo apt update
sudo apt install -y syncthing
echo "fs.inotify.max_user_watches=524288" | sudo tee -a /etc/sysctl.d/99-sysctl.conf

# UI Fonts: Iosevka nerd fonts aren't in the repos
sudo apt install -y fonts-league-mono
curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Iosevka.tar.xz
mkdir ~/Downloads/Iosevka
tar xvf Iosevka.tar.xz -C ~/Downloads/Iosevka
rm Iosevka.tar.xz
curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/IosevkaTerm.tar.xz
mkdir ~/Downloads/IosevkaTerm
tar xvf IosevkaTerm.tar.xz -C ~/Downloads/IosevkaTerm
rm IosevkaTerm.tar.xz
curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/IosevkaTermSlab.tar.xz
mkdir ~/Downloads/IosevkaTermSlab
tar xvf IosevkaTermSlab.tar.xz -C ~/Downloads/IosevkaTermSlab
rm IosevkaTermSlab.tar.xz

sudo mkdir -p /usr/share/fonts/custom

sudo cp ~/Downloads/Iosevka/*.ttf /usr/share/fonts/custom
sudo cp ~/Downloads/IosevkaTerm/*.ttf /usr/share/fonts/custom
sudo cp ~/Downloads/IosevkaTermSlab/*.ttf /usr/share/fonts/custom

sudo fc-cache -f -v
sudo cp conf/fonts-local.conf /etc/fonts/local.conf