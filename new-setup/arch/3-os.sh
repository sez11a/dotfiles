#!/bin/bash

# Plymouth
sudo pacman -S --noconfirm plymouth
sudo plymouth-set-default-theme -R bgrt
# uncomment below at your own risk; the point is to add the splash parameter
# and then re-run Grub to get a nice boot screen
# sed -i 's/^GRUB_CMDLINE_LINUX_DEFAULT.*/& splash/'  /etc/default/grub
# sudo grub-mkconfig -o /boot/grub/grub.cfg

# Startup Sound
sudo pacman -S --noconfirm alsa-utils
source common/startup-sound.sh

## Editor
sudo pacman -S --noconfirm neovim python-pynvim xclip wl-clipboard jq
curl -sLf https://raw.githubusercontent.com/sez11a/VimStar/master/install-vimstar.sh | bash

# Syncthing
sudo pacman -S --noconfirm syncthing
echo "fs.inotify.max_user_watches=524288" | sudo tee -a /etc/sysctl.d/90-override.conf

# Power
sudo pacman -R --noconfirm power-profiles-daemon
sudo pacman -S --noconfirm tlp
sudo systemctl stop systemd-rfkill.service
sudo systemctl mask systemd-rfkill.service systemd-rfkill.socket
sudo systemctl start tlp.service
sudo systemctl enable tlp.service

## UI fonts
sudo pacman -S --noconfirm otf-libertinus
sudo pacman -S --noconfirm ttf-iosevka-nerd
sudo pacman -S --noconfirm ttf-iosevkaterm-nerd
sudo pacman -S --noconfirm ttf-iosevkatermslab-nerd
sudo pacman -S --noconfirm ttf-font-awesome
sudo cp conf/fonts-local.conf /etc/fonts/local.conf

# Printers

sudo pacman -S --noconfirm cups
sudo pacman -S --noconfirm system-config-printer python-pysmbc cups-pk-helper
sudo pacman -S --noconfirm libjpeg6-turbo # for Canon driver below
yay -S --noconfirm brother-mfc-9340cdw
yay -S --noconfirm brother-hll6200dw 
yay -S --noconfirm cnrdrvcups-lb
