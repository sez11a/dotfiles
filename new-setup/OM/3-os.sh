#!/bin/bash

# Startup Sound
source common/startup-sound.sh

# MOTD
sudo bash -c $'echo "fastfetch" >> /etc/profile.d/mymotd.sh && chmod +x /etc/profile.d/mymotd.sh'

# Editor
sudo dnf -y install neovim xclipboard wl-clipboard jq yarn rust-ripgrep
curl -sLf https://raw.githubusercontent.com/sez11a/VimStar/master/install-vimstar.sh | bash

# Syncthing
sudo dnf -y install syncthing
echo "fs.inotify.max_user_watches=524288" | sudo tee -a /etc/sysctl.d/99-sysctl.conf
sudo systemctl disable syncthing --global
systemctl --user enable syncthing
# sudo flatpak -y install io.github.martchus.syncthingtray

# Power
sudo dnf -y install tlp

# UI Fonts
curl -OL https://github.com/alerque/libertinus/releases/download/v7.051/Libertinus-7.051.tar.zst
mkdir ~/Downloads/Libertinus
tar xvfz Libertinus-7.051.tar.zst -C ~/Downloads/Libertinus
rm Libertinus-7.051.tar.zst
sudo mkdir /usr/share/fonts/custom
sudo cp ~/Downloads/Libertinus/Libertinus-7.051/static/OTF/* /usr/share/fonts/custom

sudo dnf -y install enablerepo=cooker-x86_64-extra fonts-ttf-iosevka fonts-ttf-iosevkaterm fonts-ttf-iosevkatermslab

# Necessary for Rock 6.0
# curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Iosevka.tar.xz
# mkdir ~/Downloads/Iosevka
# tar xvfz Iosevka.tar.xz -C ~/Downloads/Iosevka
# rm Iosevka.tar.xz
# curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/IosevkaTerm.tar.xz
# mkdir ~/Downloads/IosevkaTerm
# tar xvfz IosevkaTerm.tar.xz -C ~/Downloads/IosevkaTerm
# rm IosevkaTerm.tar.xz
# curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/IosevkaTermSlab.tar.xz
# mkdir ~/Downloads/IosevkaTermSlab
# tar xvfz IosevkaTermSlab.tar.xz -C ~/Downloads/IosevkaTermSlab
# rm IosevkaTermSlab.tar.xz

# sudo cp ~/Downloads/Iosevka/*.ttf /usr/share/fonts/custom
# sudo cp ~/Downloads/IosevkaTerm/*.ttf /usr/share/fonts/custom
# sudo cp ~/Downloads/IosevkaTermSlab/*.ttf /usr/share/fonts/custom

sudo fc-cache -f -v

sudo cp conf/fonts-local.conf /etc/fonts/local.conf

# Printing
sudo dnf -y install task-printing-scanning task-printing-epson task-printing-hp task-printing-lexmark task-printing-misc