#!/bin/bash

mkdir -p ~/.local/share/color-schemes
cp kde/konsole/*.profile ~/.local/share/konsole
cp kde/konsole/*.colorscheme ~/.local/share/konsole
cp kde/color-schemes/*.colors ~/.local/share/color-schemes
cp kde/yakuakerc ~/.config
cp kde/yakuake.notifyrc ~/.config

mkdir -p ~/.local/share/plasma/look-and-feel
# tar xvfz kde/hybrid-desktop-global-theme.tar.gz -C ~/.local/share/plasma/look-and-feel
tar xvfz kde/com.richardsezov.hybrid-dark.tar.gz -C ~/.local/share/plasma/look-and-feel
# kwriteconfig6 --file kwinrc --group Windows --key BorderlessMaximizedWindows true
kwriteconfig6 --file kwinrc --group Windows --key TitlebarDoubleClickCommand Shade
kwriteconfig6 --file kwinrc --group org.kde.kdecoration2 --key ButtonsOnLeft XMS
kwriteconfig6 --file kwinrc --group org.kde.kdecoration2 --key ButtonsOnRight HIA
kwriteconfig6 --file plasmarc --group Theme --key name default
# KWin
# kwriteconfig6 --file kwinrc --group Plugins --key kwin4_effect_scaleinEnabled true
# kwriteconfig6 --file kwinrc --group Plugins --key magiclampEnabled true
# kwriteconfig6 --file kwinrc --group Plugins --key minimizeanimationEnabled false
kwriteconfig6 --file kwinrc --group Plugins --key windowgeometryEnabled false
kwriteconfig6 --file kwinrc --group Plugins --key wobblywindowsEnabled true
kwriteconfig6 --file kwinrc --group Windows --key Placement UnderMouse
# Breeze
kwriteconfig6 --file breezerc --group Windeco --key TitleAlignment AlignLeft
# KDE Globals
kwriteconfig6 --file kdeglobals --group General --key Name Hybrid
kwriteconfig6 --file kdeglobals --group General --key widgetStyle Oxygen
kwriteconfig6 --file kdeglobals --group KDE --key widgetStyle Oxygen
kwriteconfig6 --file kdeglobals --group General --key fixed Monospace,11,-1,5,50,0,0,0,0,0
kwriteconfig6 --file kdeglobals --group General --key font Sans\ Serif,11,-1,5,50,0,0,0,0,0
kwriteconfig6 --file kdeglobals --group General --key menuFont Sans\ Serif,11,-1,5,50,0,0,0,0,0
kwriteconfig6 --file kdeglobals --group General --key smallestReadableFont Sans\ Serif,11,-1,5,50,0,0,0,0,0
kwriteconfig6 --file kdeglobals --group General --key toolBarFont Sans\ Serif,11,-1,5,50,0,0,0,0,0
kwriteconfig6 --file kdeglobals --group General --key shadeSortColumn true
# kwriteconfig6 --file kdeglobals --group Icons --key Theme kora-light
kwriteconfig6 --file kdeglobals --group KDE --key ColorScheme CatppuccinMacchiatoBlue
kwriteconfig6 --file kdeglobals --group KDE --key SingleClick false
# KSplash
kwriteconfig6 --file ksplashrc --group KSplash --key Engine KSplashQML
kwriteconfig6 --file ksplashrc --group KSplash --key Theme org.kde.breeze.desktop
# Input
# kwriteconfig6 --file kcminputrc --group Mouse --key cursorTheme breeze-red
lookandfeeltool -a com.richardsezov.hybrid-dark --resetLayout

# Dolphin
kwriteconfig6 --file dolphinrc --group General --key EditableUrl true
kwriteconfig6 --file dolphinrc --group General --key GlobalViewProps true
kwriteconfig6 --file dolphinrc --group General --key ShowFullPath true
kwriteconfig6 --file dolphinrc --group General --key RememberOpenedTabs false
kwriteconfig6 --file dolphinrc --group General --key ShowFullPathInTitlebar true
kwriteconfig6 --file dolphinrc --group General --key ShowToolTips false

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
echo "[services][neovim-qt.desktop]" >> ~/.config/kglobalshortcutsrc
echo "_launch=Alt+V" >> ~/.config/kglobalshortcutsrc
echo " " >> ~/.config/kglobalshortcutsrc
echo "[services][brave-browser.desktop]" >> ~/.config/kglobalshortcutsrc
echo "_launch=Alt+B" >> ~/.config/kglobalshortcutsrc
echo "[services][ranger.desktop]" >> ~/.config/kglobalshortcutsrc
echo "_launch=Alt+R" >> ~/.config/kglobalshortcutsrc