#!/bin/bash

# Startup Sound
sudo dnf -qy install alsa-utils
source common/startup-sound.sh 

# Editor
sudo dnf -qy install neovim python3-neovim xclip wl-clipboard jq
curl -sLf https://raw.githubusercontent.com/sez11a/VimStar/master/install-vimstar.sh | bash

# Syncthing
sudo dnf -qy install syncthing
echo "fs.inotify.max_user_watches=524288" | sudo tee -a /etc/sysctl.d/99-sysctl.conf

# Power
sudo dnf -qy install tlp

# UI Fonts
sudo dnf -qy install texlive-libertinus texlive-libertinus-fonts
sudo dnf -qy copr enable aquacash5/nerd-fonts
sudo dnf -qy install iosevka-nerd-fonts
sudo dnf -qy install iosevka-term-nerd-fonts
sudo dnf -qy install iosevka-term-slab-nerd-fonts
sudo cp conf/fonts-local.conf /etc/fonts/local.conf
