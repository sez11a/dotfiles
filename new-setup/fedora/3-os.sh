#!/bin/bash

# Startup Sound
sudo dnf -qy install alsa-utils
sudo mkdir /usr/share/sounds/custom
sudo cp conf/a1000.wav /usr/share/sounds/custom
sudo cp conf/startup-sound.sh /usr/bin
sudo cp conf/startupsound.service /etc/systemd/system
sudo systemctl enable startupsound.service

# Editor
sudo dnf -qy install neovim python3-neovim xclip wl-clipboard jq
curl -sLf https://raw.githubusercontent.com/sez11a/VimStar/master/install-vimstar.sh | bash

# Syncthing
sudo dnf -qy install syncthing
echo "fs.inotify.max_user_watches=524288" | sudo tee -a /etc/sysctl.d/99-sysctl.conf

# Power
sudo dnf -qy install tlp

# UI Fonts
sudo dnf -qy texlive-libertinus
sudo dnf -qy copr enable aquacash5/nerd-fonts
sudo dnf -qy install iosevka-nerd-fonts
sudo dnf -qy install iosevka-term-nerd-fonts
sudo dnf -qy install iosevka-term-slab-nerd-fonts
sudo cp conf/fonts-local.conf /etc/fonts/local.conf
