#!/bin/sh

_isarch=false
[[ -f /etc/arch-release ]] && _isarch=true
[[ -f /etc/manjaro-release ]] && _isarch=true

if $_isarch; then

   # Email/PIM

   say "Do you want the KDE PIM apps?"
   if $DIALOG --yesno "Install PIM Apps?" 20 60 ;then
      sudo pacman -S --noconfirm kde-pim-meta
   else
      echo "Nope."
   fi

   # Theme Stuff
   sudo pacman -U --noconfirm caledonia-bundle-plasma5-2.0-5-any.pkg.tar.xz caledonia-backgrounds-2.0-3-any.pkg.tar.xz

	sudo pacman -S --noconfirm packagekit-qt5
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
	sudo pacman -S --noconfirm latte-dock
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
	sudo pacman -S --noconfirm kvantum

   sudo pacman -S --noconfirm libdbusmenu-glib libdbusmenu-gtk2 libdbusmenu-gtk3 libdbusmenu-qt5 appmenu-gtk-module

   yay -S --noconfirm octopi
   yay -S --noconfirm plasma5-applets-active-window-control-git
   yay -S --noconfirm plasma5-applets-window-appmenu
   yay -S --noconfirm plasma5-applets-window-buttons
   yay -S --noconfirm plasma5-applets-window-title
   # yay -S --noconfirm plasma5-applets-playbar2
   yay -S --noconfirm xfce-theme-greybird
   yay -S --noconfirm plasma5-applets-netspeed
   yay -S --noconfirm arc-kde-git
   yay -S --noconfirm kdeplasma-applets-fokus

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
   
fi

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


# Desktop Configuration

say "Do you want the hybrid desktop that's a mix of features from Amiga, GEM, Mac, Linux, and Windows?"
if $DIALOG --yesno "Hybrid desktop? Won't change layout unless chosen in System Settings." 20 60 ;then
    # yay -S --noconfirm  gmenu-dbusmenu-proxy-git
    #cp kde/plasma-org.kde.plasma.desktop-appletsrc ~/.config
    #cp kde/plasmashellrc ~/.config
    mkdir -p ~/.local/share/plasma/look-and-feel
	tar xvfz hybrid-desktop-global-theme.tar.gz -C ~/.local/share/plasma/look-and-feel
    kwriteconfig5 --file kwinrc --group Windows --key BorderlessMaximizedWindows true
    kwriteconfig5 --file kwinrc --group Windows --key TitlebarDoubleClickCommand Shade
    kwriteconfig5 --file kwinrc --group org.kde.kdecoration2 --key ButtonsOnLeft XMS
    kwriteconfig5 --file kwinrc --group org.kde.kdecoration2 --key ButtonsOnRight HIA
    kwriteconfig5 --file plasmarc --group Theme --key name default
	# KWin
	kwriteconfig5 --file kwinrc --group Plugins --key kwin4_effect_scaleinEnabled true
	kwriteconfig5 --file kwinrc --group Plugins --key magiclampEnabled true
	kwriteconfig5 --file kwinrc --group Plugins --key minimizeanimationEnabled false
	kwriteconfig5 --file kwinrc --group Plugins --key windowgeometryEnabled false
	kwriteconfig5 --file kwinrc --group Plugins --key wobblywindowsEnabled true
	kwriteconfig5 --file kwinrc --group Windows --key Placement UnderMouse
	# Breeze
	# kwriteconfig5 --file breezerc --group Common --key ShadowSize 64
	# kwriteconfig5 --file breezerc --group Common --key ShadowStrength 163
	kwriteconfig5 --file breezerc --group Windeco --key TitleAlignment AlignLeft
	# KDE Globals
	kwriteconfig5 --file kdeglobals --group General --key ColorScheme Hybrid
	kwriteconfig5 --file kdeglobals --group General --key Name Hybrid
	kwriteconfig5 --file kdeglobals --group General --key widgetStyle Oxygen
	kwriteconfig5 --file kdeglobals --group KDE --key widgetStyle Oxygen
	kwriteconfig5 --file kdeglobals --group General --key fixed Monospace,11,-1,5,50,0,0,0,0,0
	kwriteconfig5 --file kdeglobals --group General --key font Sans\ Serif,11,-1,5,50,0,0,0,0,0
	kwriteconfig5 --file kdeglobals --group General --key menuFont Sans\ Serif,11,-1,5,50,0,0,0,0,0
	kwriteconfig5 --file kdeglobals --group General --key smallestReadableFont Sans\ Serif,11,-1,5,50,0,0,0,0,0
	kwriteconfig5 --file kdeglobals --group General --key toolBarFont Sans\ Serif,11,-1,5,50,0,0,0,0,0
	kwriteconfig5 --file kdeglobals --group General --key shadeSortColumn true
	# kwriteconfig5 --file kdeglobals --group General --key widgetStyle Breeze
#	if [ -d "~/.local/share/icons/kora-light" ]
#	then
	kwriteconfig5 --file kdeglobals --group Icons --key Theme kora-light
#	else
#		kwriteconfig5 --file kdeglobals --group Icons --key Theme breeze
#	fi
	kwriteconfig5 --file kdeglobals --group KDE --key ColorScheme Hybrid
	kwriteconfig5 --file kdeglobals --group KDE --key SingleClick false
	# KSplash
	kwriteconfig5 --file ksplashrc --group KSplash --key Engine KSplashQML
	kwriteconfig5 --file ksplashrc --group KSplash --key Theme org.kde.breeze.desktop
	# Input
	kwriteconfig5 --file kcminputrc --group Mouse --key cursorTheme breeze-red
else
    echo "Nope.";
fi

#KWin
kwriteconfig5 --file kwinrc --group Compositing --key Backend OpenGL
kwriteconfig5 --file kwinrc --group Compositing --key Enabled true


# Dolphin
kwriteconfig5 --file dolphinrc --group General --key EditableUrl true
kwriteconfig5 --file dolphinrc --group General --key GlobalViewProps true
kwriteconfig5 --file dolphinrc --group General --key ShowFullPath true


# Konsole
kwriteconfig5 --file konsolerc --group Desktop\ Entry --key DefaultProfile Commodore.profile
kwriteconfig5 --file konsolerc --group Favorite\ Profiles --key Favorites Amiga\ 3.profile,8086.profile,Commodore.profile,NewGray.profile,Old\ Text\ Mode.profile


# Keyboard
kwriteconfig5 --file kxkbrc --group Layout --key Options ctrl:swapcaps

# Oxygen
kwriteconfig5 --file oxygenrc --group ActiveShadow --key ShadowSize 50
kwriteconfig5 --file oxygenrc --group InactiveShadow --key ShadowSize 99
kwriteconfig5 --file oxygenrc --group InactiveShadow --key VerticalOffset 0
kwriteconfig5 --file oxygenrc --group Windeco --key TitleAlignment AlignLeft
kwriteconfig5 --file oxygenrc --group Windeco --key UseWindowColors false
