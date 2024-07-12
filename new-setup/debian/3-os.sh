#!/bin/bash

sudo apt install -y alsa-utils
sudo mkdir /usr/share/sounds/custom
sudo cp conf/a1000.wav /usr/share/sounds/custom
sudo cp conf/startup-sound.sh /usr/bin
sudo cp conf/startupsound.service /etc/systemd/system
sudo systemctl enable startupsound.service

## Editor
sudo apt install -y neovim python3-pynvim xclip wl-clipboard jq
curl -sLf https://raw.githubusercontent.com/sez11a/VimStar/master/install-vimstar.sh | bash

# Syncthing
sudo apt install -y syncthing
echo "fs.inotify.max_user_watches=524288" | sudo tee -a /etc/sysctl.d/99-sysctl.conf

# Syncthing Integration
flatpak install -y --noninteractive flathub SyncThingy 

# UI Fonts
sudo apt install -y fonts-league-mono texlive-fonts-extra texlive-latex-extra
# No Iosevka fonts are in the repos; devise another way to install them.
sudo cp conf/fonts-local.conf /etc/fonts/local.conf

# Mouse cursors
sudo apt install -y oxygencursors
