#!/bin/sh

# Theme Stuff 
sudo pacman -U --noconfirm caledonia-bundle-plasma5-2.0-5-any.pkg.tar.xz caledonia-backgrounds-2.0-3-any.pkg.tar.xz 

sudo pacman -S --noconfirm kaccounts-providers kio-gdrive kwalletmanager neovim-qt gst-libav gst-plugins-bad gst-plugins-ugly gst-python krusader kdesvn kdenlive frei0r-plugins audex krename choqok smb4k bibletime kcharselect kamoso latte-dock ktorrent digikam kleopatra arc-kde kvantum-theme-arc falkon unzip kio-gdrive flameshot krita opencolorio krita-plugin-gmic libheif

trizen -S --noconfirm --noedit plasma5-applets-active-window-control-git plasma5-applets-playbar2 syncthingtray xfce-theme-greybird plasma5-applets-netspeed

# KDE Config

mkdir ~/.local/share/color-schemes
cp kde/konsole/*.profile ~/.local/share/konsole
cp kde/konsole/*.colorscheme ~/.local/share/konsole
cp kde/color-schemes/*.colors ~/.local/share/color-schemes
cp kde/yakuakerc ~/.config
cp kde/yakuake.notifyrc ~/.config

# Desktop Configuration

say "Do you want the hybrid desktop that's a mix of features from Amiga, GEM, Mac, Linux, and Windows?"
if $DIALOG --yesno "Hybrid desktop? Won't change layout unless chosen in System Settings." 20 60 ;then
    sudo pacman -S --noconfirm libdbusmenu-glib libdbusmenu-gtk2 libdbusmenu-gtk3 libdbusmenu-qt5 appmenu-gtk-module 
    trizen -S --noconfirm --noedit gmenu-dbusmenu-proxy-git 
    #cp kde/plasma-org.kde.plasma.desktop-appletsrc ~/.config
    #cp kde/plasmashellrc ~/.config
    mkdir ~/.local/share/plasma
    mkdir ~/.local/share/plasma/look-and-feel
    unzip hybrid-desktop.zip -d ~/.local/share/plasma/look-and-feel/
    kwriteconfig5 --file kwinrc --group Windows --key BorderlessMaximizedWindows true
    kwriteconfig5 --file kwinrc --group Windows --key TitlebarDoubleClickCommand Shade
    kwriteconfig5 --file kwinrc --group org.kde.kdecoration2 --key ButtonsOnLeft XMS
    kwriteconfig5 --file kwinrc --group org.kde.kdecoration2 --key ButtonsOnRight HIA
    kwriteconfig5 --file plasmarc --group Theme --key name default
else 
    echo "Nope."; 
fi

#KWin
kwriteconfig5 --file kwinrc --group Compositing --key Backend OpenGL
kwriteconfig5 --file kwinrc --group Compositing --key Enabled true
kwriteconfig5 --file kwinrc --group Plugins --key kwin4_effect_scaleinEnabled true
kwriteconfig5 --file kwinrc --group Plugins --key magiclampEnabled true
kwriteconfig5 --file kwinrc --group Plugins --key minimizeanimationEnabled false
kwriteconfig5 --file kwinrc --group Plugins --key windowgeometryEnabled false
kwriteconfig5 --file kwinrc --group Plugins --key wobblywindowsEnabled true

# Breeze
kwriteconfig5 --file breezerc --group Common --key ShadowSize 64
kwriteconfig5 --file breezerc --group Common --key ShadowStrength 163
kwriteconfig5 --file breezerc --group Windeco --key TitleAlignment AlignLeft

# Dolphin
kwriteconfig5 --file dolphinrc --group General --key EditableUrl true
kwriteconfig5 --file dolphinrc --group General --key GlobalViewProps true
kwriteconfig5 --file dolphinrc --group General --key ShowFullPath true

# Input
kwriteconfig5 --file kcminputrc --group Mouse --key cursorTheme oxy-red-argentina

# KDE Globals
kwriteconfig5 --file kdeglobals --group General --key ColorScheme Hybrid
kwriteconfig5 --file kdeglobals --group General --key Name Breeze
kwriteconfig5 --file kdeglobals --group General --key fixed Anonymous\ Pro\ for\ Powerline,11,-1,5,50,0,0,0,0,0
kwriteconfig5 --file kdeglobals --group General --key font Sans\ Serif,11,-1,5,50,0,0,0,0,0
kwriteconfig5 --file kdeglobals --group General --key menuFont Sans\ Serif,11,-1,5,50,0,0,0,0,0
kwriteconfig5 --file kdeglobals --group General --key smallestReadableFont Sans\ Serif,11,-1,5,50,0,0,0,0,0
kwriteconfig5 --file kdeglobals --group General --key toolBarFont Sans\ Serif,11,-1,5,50,0,0,0,0,0
kwriteconfig5 --file kdeglobals --group General --key shadeSortColumn true
kwriteconfig5 --file kdeglobals --group General --key widgetStyle Breeze
kwriteconfig5 --file kdeglobals --group Icons --key Theme breeze
kwriteconfig5 --file kdeglobals --group KDE --key ColorScheme Hybrid
kwriteconfig5 --file kdeglobals --group KDE --key widgetStyle breeze
kwriteconfig5 --file kdeglobals --group KDE --key SingleClick false

# Konsole
kwriteconfig5 --file konsolerc --group Desktop\ Entry --key DefaultProfile Commodore.profile
kwriteconfig5 --file konsolerc --group Favorite\ Profiles --key Favorites Amiga\ 3.profile,8086.profile,Commodore.profile,NewGray.profile,Old\ Text\ Mode.profile

# KSplash
kwriteconfig5 --file ksplashrc --group KSplash --key Engine KSplashQML
kwriteconfig5 --file ksplashrc --group KSplash --key Theme org.kde.breeze.desktop

# Keyboard
kwriteconfig5 --file kxkbrc --group Layout --key Options ctrl:swapcaps

# Oxygen
kwriteconfig5 --file oxygenrc --group ActiveShadow --key ShadowSize 50
kwriteconfig5 --file oxygenrc --group InactiveShadow --key ShadowSize 99
kwriteconfig5 --file oxygenrc --group InactiveShadow --key VerticalOffset 0
kwriteconfig5 --file oxygenrc --group Windeco --key TitleAlignment AlignLeft
kwriteconfig5 --file oxygenrc --group Windeco --key UseWindowColors false

