#!/bin/sh

# Email/PIM

sudo pacman -S --noconfirm kde-pim-meta

## Mouse Cursors
sudo pacman -U --noconfirm packages/breeze-red-cursor-theme-1.0-3-any.pkg.tar.xz 
sudo pacman -U --noconfirm packages/oxygen-cursors-extra-6.2.3-1-any.pkg.tar.xz
#yay -S --noconfirm  breeze-red-cursor-theme

yay -S --noconfirm syncthingtray-qt6

# Theme Stuff
sudo pacman -U --noconfirm packages/caledonia-bundle-plasma5-2.0-5-any.pkg.tar.xz 
sudo pacman -U --noconfirm packages/caledonia-backgrounds-2.0-3-any.pkg.tar.xz
sudo pacman -S --noconfirm kvantum
sudo pacman -S --noconfirm libdbusmenu-glib libdbusmenu-gtk2 libdbusmenu-gtk3 libdbusmenu-qt5 appmenu-gtk-module plasma-sdk

# sudo pacman -U --noconfirm kde/plasma6-applets-window-buttons-1:r183.7d9cb3e-1-x86_64.pkg.tar.xz
plasmapkg2 -i kde/Window-Button-Applet.plasmoid 
sudo mkdir -p /usr/lib/qt6/qml/org/kde/appletdecoration/ 
sudo cp -r ~/.local/share/plasma/plasmoids/org.kde.windowbuttons/lib/* /usr/lib/qt6/qml/org/kde/appletdecoration/
yay -S --noconfirm libdbusmenu-qtilities6-git
yay -S --noconfirm plasma6-applets-window-title
yay -S --noconfirm plasma6-applets-netspeed
yay -S --noconfirm plasma6-applets-plasmusic-toolbar
yay -S --noconfirm plasma6-applets-fokus
yay -S --noconfirm xfce-theme-greybird
yay -S --noconfirm klassy

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

# KDE Config

mkdir -p ~/.local/share/color-schemes
cp kde/konsole/*.profile ~/.local/share/konsole
cp kde/konsole/*.colorscheme ~/.local/share/konsole
cp kde/color-schemes/*.colors ~/.local/share/color-schemes
cp kde/yakuakerc ~/.config
cp kde/yakuake.notifyrc ~/.config
mkdir -p ~/.local/share/plasma/desktoptheme
tar xvfz kde/hybrid-light.tar.gz -C ~/.local/share/plasma/desktoptheme
mkdir -p ~/.local/share/aurorae/themes
tar xvfz kde/hybrid-wd.tar.gz -C ~/.local/share/aurorae/themes
cp -r kde/com.himdek.kde.plasma.overview ~/.local/share/plasma/plasmoids

# Desktop Configuration

mkdir -p ~/.local/share/plasma/look-and-feel
tar xvfz kde/hybrid-desktop-global-theme.tar.gz -C ~/.local/share/plasma/look-and-feel
tar xvfz kde/hybrid-dark.tar.gz -C ~/.local/share/plasma/look-and-feel
kwriteconfig6 --file kwinrc --group Windows --key BorderlessMaximizedWindows true
kwriteconfig6 --file kwinrc --group Windows --key TitlebarDoubleClickCommand Shade
kwriteconfig6 --file kwinrc --group org.kde.kdecoration2 --key ButtonsOnLeft XMS
kwriteconfig6 --file kwinrc --group org.kde.kdecoration2 --key ButtonsOnRight HIA
kwriteconfig6 --file plasmarc --group Theme --key name default
# KWin
kwriteconfig6 --file kwinrc --group Plugins --key kwin4_effect_scaleinEnabled true
kwriteconfig6 --file kwinrc --group Plugins --key magiclampEnabled true
kwriteconfig6 --file kwinrc --group Plugins --key minimizeanimationEnabled false
kwriteconfig6 --file kwinrc --group Plugins --key windowgeometryEnabled false
kwriteconfig6 --file kwinrc --group Plugins --key wobblywindowsEnabled true
kwriteconfig6 --file kwinrc --group Windows --key Placement UnderMouse
# Breeze
kwriteconfig6 --file breezerc --group Windeco --key TitleAlignment AlignLeft
# KDE Globals
kwriteconfig6 --file kdeglobals --group General --key ColorScheme Hybrid
kwriteconfig6 --file kdeglobals --group General --key Name Hybrid
kwriteconfig6 --file kdeglobals --group General --key widgetStyle Oxygen
kwriteconfig6 --file kdeglobals --group KDE --key widgetStyle Oxygen
kwriteconfig6 --file kdeglobals --group General --key fixed Monospace,11,-1,5,50,0,0,0,0,0
kwriteconfig6 --file kdeglobals --group General --key font Sans\ Serif,11,-1,5,50,0,0,0,0,0
kwriteconfig6 --file kdeglobals --group General --key menuFont Sans\ Serif,11,-1,5,50,0,0,0,0,0
kwriteconfig6 --file kdeglobals --group General --key smallestReadableFont Sans\ Serif,11,-1,5,50,0,0,0,0,0
kwriteconfig6 --file kdeglobals --group General --key toolBarFont Sans\ Serif,11,-1,5,50,0,0,0,0,0
kwriteconfig6 --file kdeglobals --group General --key shadeSortColumn true
kwriteconfig6 --file kdeglobals --group Icons --key Theme kora-light
kwriteconfig6 --file kdeglobals --group KDE --key ColorScheme CatppuccinMacchiatoBlue
kwriteconfig6 --file kdeglobals --group KDE --key SingleClick false
# KSplash
kwriteconfig6 --file ksplashrc --group KSplash --key Engine KSplashQML
kwriteconfig6 --file ksplashrc --group KSplash --key Theme org.kde.breeze.desktop
# Input
kwriteconfig6 --file kcminputrc --group Mouse --key cursorTheme breeze-red
lookandfeeltool -a Hybrid-Dark --resetLayout

# Dolphin
kwriteconfig6 --file dolphinrc --group General --key EditableUrl true
kwriteconfig6 --file dolphinrc --group General --key GlobalViewProps true
kwriteconfig6 --file dolphinrc --group General --key ShowFullPath true

# Konsole
kwriteconfig6 --file konsolerc --group Desktop\ Entry --key DefaultProfile Catppuccin.profile
kwriteconfig6 --file konsolerc --group Favorite\ Profiles --key Favorites Amiga\ 3.profile,8086.profile,Commodore.profile,NewGray.profile,Old\ Text\ Mode.profile

# Keyboard
kwriteconfig6 --file kxkbrc --group Layout --key Options ctrl:swapcaps

# Oxygen
#kwriteconfig6 --file oxygenrc --group ActiveShadow --key ShadowSize 50
#kwriteconfig6 --file oxygenrc --group InactiveShadow --key ShadowSize 99
#kwriteconfig6 --file oxygenrc --group InactiveShadow --key VerticalOffset 0
#kwriteconfig6 --file oxygenrc --group Windeco --key TitleAlignment AlignLeft
#kwriteconfig6 --file oxygenrc --group Windeco --key UseWindowColors false

# KGlobalShortcuts 
kwriteconfig6 --file kglobalshortcutsrc --group kwin --key "Switch One Desktop to the Left" "Meta+Ctrl+Left\tMeta+Ctrl+H,Switch One Desktop to the Left"
kwriteconfig6 --file kglobalshortcutsrc --group kwin --key "Switch One Desktop to the Right" "Meta+Ctrl+Right\tMeta+Ctrl+L,Switch One Desktop to the Right"
kwriteconfig6 --file kglobalshortcutsrc --group kwin --key "Window Close" "Alt+F4\tMeta+C,Alt+F4,Close Window"
# For whatever reason, kwriteconfig6, though documented to use nested groups, 
# does not modify kglobalshortcutsrc; it fails. The below changes are therefore being 
# done without it. 
echo " " >> ~/.config/kglobalshortcutsrc
echo "[services][vifm.desktop]" >> ~/.config/kglobalshortcutsrc
echo "_launch=Alt+Return" >> ~/.config/kglobalshortcutsrc
echo " " >> ~/.config/kglobalshortcutsrc
echo "[services][neovide.desktop]" >> ~/.config/kglobalshortcutsrc
echo "_launch=Alt+V" >> ~/.config/kglobalshortcutsrc
echo " " >> ~/.config/kglobalshortcutsrc
echo "[services][brave-browser.desktop]" >> ~/.config/kglobalshortcutsrc
echo "_launch=Alt+B">> ~/.config/kglobalshortcutsrc

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
