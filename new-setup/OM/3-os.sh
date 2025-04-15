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
curl -OL https://github.com/alerque/libertinus/releases/download/v7.051/Libertinus-7.051.tar.zst
mkdir ~/Downloads/Libertinus 
tar xvfz Libertinus-7.051.tar.zst -C ~/Downloads/Libertinus
rm Libertinus-7.051.tar.zst

curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Iosevka.tar.xz
mkdir ~/Downloads/Iosevka
tar xvfz Iosevka.tar.xz -C ~/Downloads/Iosevka
rm Iosevka.tar.xz
curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/IosevkaTerm.tar.xz
mkdir ~/Downloads/IosevkaTerm
tar xvfz IosevkaTerm.tar.xz -C ~/Downloads/IosevkaTerm
rm IosevkaTerm.tar.xz
curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/IosevkaTermSlab.tar.xz
mkdir ~/Downloads/IosevkaTermSlab
tar xvfz IosevkaTermSlab.tar.xz -C ~/Downloads/IosevkaTermSlab
rm IosevkaTermSlab.tar.xz

sudo mkdir /usr/share/fonts/custom
sudo cp ~/Downloads/Libertinus/Libertinus-7.051/static/OTF/* /usr/share/fonts/custom
sudo cp ~/Downloads/Iosevka/*.ttf /usr/share/fonts/custom 
sudo cp ~/Downloads/IosevkaTerm/*.ttf /usr/share/fonts/custom 
sudo cp ~/Downloads/IosevkaTermSlab/*.ttf /usr/share/fonts/custom 
sudo fc-cache -f -v

sudo cp conf/fonts-local.conf /etc/fonts/local.conf
