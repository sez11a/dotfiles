#!/bin/bash

# Startup Sound
source common/startup-sound.sh 

# Editor
sudo dnf -y install neovim xclipboard wl-clipboard jq yarn
curl -sLf https://raw.githubusercontent.com/sez11a/VimStar/master/install-vimstar.sh | bash

# Syncthing
sudo dnf -y install syncthing
echo "fs.inotify.max_user_watches=524288" | sudo tee -a /etc/sysctl.d/99-sysctl.conf
systemctl --user enable syncthing

# Power
sudo dnf -y install tlp

# UI Fonts
sudo dnf -y install texlive-libertinus texlive-libertinus-fonts texlive-libertinus-otf texlive-libertinus-type1 texlive-libertinust1math
curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Iosevka.tar.xz
mkdir ~/Downloads/Iosevka
tar xvfz Iosevka.tar.xz -C ~/Downloads/Iosevka
curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/IosevkaTerm.tar.xz
mkdir ~/Downloads/IosevkaTerm
tar xvfz IosevkaTerm.tar.xz -C ~/Downloads/IosevkaTerm
curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/IosevkaTermSlab.tar.xz
mkdir ~/Downloads/IosevkaTermSlab
tar xvfz IosevkaTermSlab.tar.xz -C ~/Downloads/IosevkaTermSlab

sudo cp ~/Downloads/Iosevka/*.ttf /usr/share/fonts/TTF 
sudo cp ~/Downloads/IosevkaTerm/*.ttf /usr/share/fonts/TTF 
sudo cp ~/Downloads/IosevkaTermSlab/*.ttf /usr/share/fonts/TTF 
sudo fc-cache -f -v

sudo cp conf/fonts-local.conf /etc/fonts/local.conf
