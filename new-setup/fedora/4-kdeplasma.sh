#!/bin/bash

sudo dnf -qy install kdepim

## Mouse cursors
sudo dnf -qy install oxygen-cursor-themes

## Theme Stuff
sudo dnf -qy install kvantum
sudo dnf -qy install dbusmenu-qt

# Need to find a way to get netspeed, plasmusic-toolbar 
sudo dnf -qy copr enable hazel-bunny/ricing
sudo dnf -qy install applet-window-buttons
sudo dnf -qy install applit-window-title
sudo dnf -qy install appmenu-gtk-module
sudo dnf -qy install klassy
sudo dnf -qy install kora-icon-theme
sudo dnf -qy install fokus-plasmoid

cp -r ~/kora-icons/kora ~/.local/share/icons
cp -r ~/kora-icons/kora-light ~/.local/share/icons
cp -r ~/kora-icons/kora-light-panel ~/.local/share/icons
cp -r ~/kora-icons/kora-pgrey ~/.local/share/icons

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
