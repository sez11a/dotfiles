#!/bin/sh

# Email/PIM

sudo pacman -S --noconfirm kde-pim-meta

## Mouse Cursors
sudo pacman -U --noconfirm packages/breeze-red-cursor-theme-1.0-3-any.pkg.tar.xz 
sudo pacman -U --noconfirm packages/oxygen-cursors-extra-6.2.3-1-any.pkg.tar.xz
#yay -S --noconfirm  breeze-red-cursor-theme

# yay -S --noconfirm syncthingtray-qt6

# Theme Stuff
sudo pacman -U --noconfirm packages/caledonia-bundle-plasma5-2.0-5-any.pkg.tar.xz 
sudo pacman -U --noconfirm packages/caledonia-backgrounds-2.0-3-any.pkg.tar.xz
sudo pacman -S --noconfirm kvantum
sudo pacman -S --noconfirm libdbusmenu-glib libdbusmenu-gtk2 libdbusmenu-gtk3 libdbusmenu-qt5 appmenu-gtk-module plasma-sdk

# sudo pacman -U --noconfirm kde/plasma6-applets-window-buttons-1:r183.7d9cb3e-1-x86_64.pkg.tar.xz
# plasmapkg2 -i kde/Window-Button-Applet.plasmoid 
# sudo mkdir -p /usr/lib/qt6/qml/org/kde/appletdecoration/ 
# sudo cp -r ~/.local/share/plasma/plasmoids/org.kde.windowbuttons/lib/* /usr/lib/qt6/qml/org/kde/appletdecoration/
yay -S --noconfirm libdbusmenu-qtilities6-git
# yay -S --noconfirm plasma6-applets-window-title
yay -S --noconfirm plasma6-applets-netspeed
yay -S --noconfirm plasma6-applets-plasmusic-toolbar
yay -S --noconfirm plasma6-applets-fokus
yay -S --noconfirm xfce-theme-greybird
# yay -S --noconfirm klassy

# Syncthing must sync first for below to work
# cp -r ~/config/icons/kora/* ~/.local/share/icons

# Get Kora icons from the Internet instead
# git clone https://github.com/bikass/kora.git ~/kora-icons

# cp -r ~/kora-icons/kora ~/.local/share/icons
# cp -r ~/kora-icons/kora-light ~/.local/share/icons
# cp -r ~/kora-icons/kora-light-panel ~/.local/share/icons
# cp -r ~/kora-icons/kora-pgrey ~/.local/share/icons

# Even better: AUR has kora icons
yay -S --noconfirm kora-icon-theme

# KDE Desktop Configuration

source common/configure-kdeplasma.sh 

sudo pacman -S --noconfirm packagekit-qt6
sudo pacman -S --noconfirm okular
sudo pacman -S --noconfirm discover
sudo pacman -S --noconfirm kaccounts-providers
sudo pacman -S --noconfirm kio-gdrive
sudo pacman -S --noconfirm kwalletmanager
sudo pacman -S --noconfirm neovim-qt
sudo pacman -S --noconfirm yakuake
sudo pacman -S --noconfirm gst-libav
sudo pacman -S --noconfirm gst-plugins-bad
sudo pacman -S --noconfirm gst-plugins-ugly
sudo pacman -S --noconfirm gst-python
sudo pacman -S --noconfirm krusader
sudo pacman -S --noconfirm kdenlive
sudo pacman -S --noconfirm frei0r-plugins
sudo pacman -S --noconfirm audex
sudo pacman -S --noconfirm krename
sudo pacman -S --noconfirm smb4k
sudo pacman -S --noconfirm bibletime
sudo pacman -S --noconfirm kcharselect
sudo pacman -S --noconfirm kamoso
sudo pacman -S --noconfirm ktorrent
sudo pacman -S --noconfirm digikam
sudo pacman -S --noconfirm kleopatra
sudo pacman -S --noconfirm falkon
sudo pacman -S --noconfirm unzip
sudo pacman -S --noconfirm krita
sudo pacman -S --noconfirm opencolorio
sudo pacman -S --noconfirm krita-plugin-gmic
sudo pacman -S --noconfirm libheif
sudo pacman -S --noconfirm xdg-desktop-portal-kde
sudo pacman -S --noconfirm kid3
sudo pacman -S --noconfirm k3b

yay -S --noconfirm octopi
