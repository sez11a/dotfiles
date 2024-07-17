#!/bin/bash

# Startup Sound
sudo pacman -S --noconfirm alsa-utils
sudo mkdir /usr/share/sounds/custom
sudo cp conf/a1000.wav /usr/share/sounds/custom
sudo cp conf/startup-sound.sh /usr/bin
sudo cp conf/startupsound.service /etc/systemd/system
sudo systemctl enable startupsound.service

# Editor
sudo dnf -qy neovim python3-neovim xclip wl-clipboard jq
curl -sLf https://raw.githubusercontent.com/sez11a/VimStar/master/install-vimstar.sh | bash

# Syncthing
sudo dnf -qy Syncthing
echo "fs.inotify.max_user_watches=524288" | sudo tee -a /etc/sysctl.d/99-sysctl.conf
