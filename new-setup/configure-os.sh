#!/bin/bash

_rundir=$(pwd)

# Set some colors for output messages
OK="$(tput setaf 2)[OK]$(tput sgr0)"
ERROR="$(tput setaf 1)[ERROR]$(tput sgr0)"
NOTE="$(tput setaf 3)[NOTE]$(tput sgr0)"
WARN="$(tput setaf 166)[WARN]$(tput sgr0)"
CAT="$(tput setaf 6)[ACTION]$(tput sgr0)"
ORANGE=$(tput setaf 166)
YELLOW=$(tput setaf 3)
RESET=$(tput sgr0)

_isarch=true
_ismanjaro=false
_isfedora=false

scriptsDir="arch"

[[ -f /etc/manjaro-release ]] && _ismanjaro=true
if [ -f /etc/fedora-release ] 
  then 
    _isfedora=true
    _isarch=false
    scriptsDir="fedora"
fi

source $scriptsDir/1-preliminary.sh

# Preliminaries are now out of the way; time for questions

say "Does this machine have a HIDPI screen?"
if $DIALOG --yesno "HIDPI screen?" 20 60 ;then
    sudo cp conf/vconsole.conf /etc
else
    echo "Nope."
fi

DesktopApps=false
say "Install standard desktop apps?"
if $DIALOG --yesno "Install standard desktop apps?" 20 60; then 
  DesktopApps=true; else echo "Nope."; fi 

ThreeDPrintingApps=false
say "Install 3D printing apps?"
if $DIALOG --yesno "Install 3D printing apps?" 20 60; then 
  ThreeDPrintingApps=true; else echo "Nope."; fi 

DevTools=false
say "Do you want to install developer tools?"
if $DIALOG --yesno "Install Dev Tools?" 20 60 ;then
    DevTools=true; else echo "Nope."; fi

LaTeX=false
say "Do you want to install LaTeX?"
if $DIALOG --yesno "Install LaTeX?" 20 60 ;then
    LaTeX=true; else echo "Nope."; fi

emulators=false
say "Do you want to install emulators for vintage computing?"
if $DIALOG --yesno "Install emulators for vintage computing?" 20 60 ;then
    emulators=true; else echo "Nope."; fi

plasma=false
say "Configure Plasma Desktop?"
if $DIALOG --yesno "Configure Standard Plasma Desktop? Default is yes; if installing a lightweight system, answer no." 20 60; then 
  plasma=true; else echo "Nope."; fi
    
# Plymouth
sudo pacman -S --noconfirm plymouth
sudo plymouth-set-default-theme -R bgrt
# uncomment below at your own risk; the point is to add the splash parameter
# and then re-run Grub to get a nice boot screen
# sed -i 's/^GRUB_CMDLINE_LINUX_DEFAULT.*/& splash/'  /etc/default/grub
# sudo grub-mkconfig -o /boot/grub/grub.cfg

# Startup Sound
sudo pacman -S --noconfirm alsa-utils
sudo mkdir /usr/share/sounds/custom
sudo cp conf/a1000.wav /usr/share/sounds/custom
sudo cp conf/startup-sound.sh /usr/bin
sudo cp conf/startupsound.service /etc/systemd/system
sudo systemctl enable startupsound.service

## Editor
sudo pacman -S --noconfirm neovim python-pynvim xclip wl-clipboard jq
curl -sLf https://raw.githubusercontent.com/sez11a/VimStar/master/install-vimstar.sh | bash

# Syncthing
sudo pacman -S --noconfirm syncthing
echo "fs.inotify.max_user_watches=524288" | sudo tee -a /etc/sysctl.d/90-override.conf

# Syncthing Integration
flatpak install -y --noninteractive flathub SyncThingy 
# yay -S --noconfirm syncthingtray-qt6

# Power
sudo pacman -R --noconfirm power-profiles-daemon
sudo pacman -S --noconfirm tlp
sudo systemctl stop systemd-rfkill.service
sudo systemctl mask systemd-rfkill.service systemd-rfkill.socket
sudo systemctl start tlp.service
sudo systemctl enable tlp.service

## UI fonts
sudo pacman -S --noconfirm libertinus-font
sudo pacman -S --noconfirm ttf-iosevka-nerd
sudo pacman -S --noconfirm ttf-iosevkaterm-nerd
sudo pacman -S --noconfirm ttf-iosevkatermslab-nerd
sudo cp conf/fonts-local.conf /etc/fonts/local.conf

## Mouse Cursors
sudo pacman -U --noconfirm packages/breeze-red-cursor-theme-1.0-3-any.pkg.tar.xz 
#yay -S --noconfirm  breeze-red-cursor-theme

# Desktop

if [ "$plasma" = true ] ;then
  source ./configure-plasma6.sh
fi

## Fonts

sudo pacman -S --noconfirm ttf-gentium-plus
yay -S --noconfirm  otf-fantasque-sans-mono 
yay -S --noconfirm ttf-mplus 
yay -S --noconfirm nerd-fonts-hermit 
yay -S --noconfirm ttf-anonymice-powerline-git 
yay -S --noconfirm ttf-carlito 
yay -S --noconfirm ttf-caladea
yay -S --noconfirm ttf-gidole 
yay -S --noconfirm otf-vegur 
yay -S --noconfirm otf-tenderness 
yay -S --noconfirm ttf-exljbris

## Removed Caladea from above because it conflicted with Google Fonts

cp conf/fonts.conf ~/.config/fontconfig
sudo mkdir /usr/share/fonts/TTF
sudo mkdir /usr/share/fonts/OTF
sudo cp fonts/*.ttf /usr/share/fonts/TTF
sudo cp fonts/*.otf /usr/share/fonts/OTF
sudo fc-cache -f -v

# Undelete Files

sudo pacman -S --noconfirm ddrescue ext4magic testdisk
yay -S --noconfirm  r-linux extundelete

# Java Environment
yay -S --noconfirm zulu-21-bin
sudo archlinux-java set zulu-21


if [ "$DesktopApps" = true ] ;then
    echo "Installing standard desktop apps...."

    # Standard desktop stuff

    if $_ismanjaro; then
      sudo pacman -R --noconfirm libreoffice-still
    fi
    sudo pacman -S --noconfirm xsel libdvdcss bottom pandoc-cli bash-completion audacity borg spamassassin razor calibre neovide mc p7zip whois projectm easytag fuse handbrake tk scribus vpnc networkmanager-vpnc fontforge kdiff3 dvgrab dvdauthor inkscape strawberry conky libreoffice-fresh offlineimap dovecot neomutt w3m urlscan lha zip unzip vifm xdg-desktop-portal filelight mplayer fzf ripgrep the_silver_searcher fd ranger libaacs mpv smplayer smplayer-skins smplayer-themes ctags pstoedit libmythes beanshell coin-or-mp yt-dlp atomicparsley aria2 discord cdrdao cdrtools libisofs dvd+rw-tools hunspell hunspell-en_us hyphen hyphen-en

   sudo pacman -S --noconfirm packagekit-qt6
   
    # Apps in AUR

    yay -S --noconfirm  todotxt freeplane todotxt-machine-git deb2targz moodbar boomaga libbdplus brave-bin joe zoom goneovim-bin

else
    echo "Skipping standard desktop apps...."
fi

if [ "$ThreeDPrintingApps" = true ] ;then
    echo "Installing 3D Printing apps...." 

    sudo pacman -S --noconfirm superslicer prusa-slicer freecad openscad platformio-core platformio-core-udev
    yay -S --noconfirm cura-bin
    yay -S --noconfirm orca-slicer-bin

else 
    echo "Skipping 3D Printing Apps...." 
fi

# Printers

sudo pacman -S --noconfirm libjpeg6-turbo # for Canon driver below
yay -S --noconfirm brother-mfc-9340cdw
yay -S --noconfirm brother-hll6200dw 
yay -S --noconfirm cnrdrvcups-lb


if [ "$DevTools" = true ] ;then
    source ./install-dev-tools.sh; 
else 
    echo "Not installing Dev Tools" 
fi

if [ "$LaTeX" = true ] ;then
    source ./install-latex.sh; 
else 
    echo "Not installing LaTeX." 
fi

if [ "$emulators" = true ] ;then
    source ./install-emulators.sh;
else 
    echo "Not installing emulators." 
fi

if [ "$plasma" = false ] ;then
  echo "If you want to configure Plasma later, run configure-plasma6.sh from this folder."
  say "If you want to configure Plasma later, run configure-plasma6.sh from this folder."
fi

echo "All done! Please reboot your system now."
say "All done! Please reboot your system now."

exit 0;