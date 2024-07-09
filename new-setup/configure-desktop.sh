#!/bin/bash

_isarch=true
_ismanjaro=false
_isfedora=false

[[ -f /etc/manjaro-release ]] && _ismanjaro=true
if [ -f /etc/fedora-release ] 
  then 
    _isfedora=true
    _isarch=false
fi

if $_isfedora; then 
  sudo dnf -qy install newt stow
else 
  sudo pacman -S --noconfirm stow
fi

DIALOG=whiptail

# Dotfiles

zip old-config-files.zip ~/.profile ~/.bash_profile ~/.bashrc ~/.bash_logout ~/.xprofile
rm ~/.profile ~/.bash_profile ~/.bashrc ~/.bash_logout ~/.xprofile
mv old-config-files.zip ~
cd ..
stow . 
cd new-setup
cp ./desktop/*.desktop ~/Desktop

# Set up for installation
sudo pacman -S --noconfirm festival festival-english festival-us rsync
function say { echo "$1" | festival --tts; }
export -f say

# AUR Helper
# If on Arch, install this before running this script. On Manjaro and EndeavourOS, 
# it's in the repo, so we can just call the installer and get it.

if $_ismanjaro; then
  sudo pacman -S --noconfirm yay
fi

# On Manjaro, run the below command. Otherwise, set up Reflector.
if $_ismanjaro; then
  sudo pacman-mirrors -f 0
else 
  sudo pacman -S --noconfirm reflector 
  sudo mv /etc/xdg/reflector/reflector.conf /etc/xdg/reflector/reflector.conf.orig
  sudo cp ./conf/reflector.conf /etc/xdg/reflector
  sudo systemctl start reflector.service
  sudo systemctl enable reflector.timer
fi

# Now we should be using the fastest mirrors; run an update before doing anything
sudo pacman -Syu --noconfirm

# Improve AUR Performance
# Install the multicore compression utilities.
# Rename makepkg.conf and replace it with the multicore version.

sudo pacman -S --noconfirm pbzip2 pigz lbzip2 lrzip
sudo mv /etc/makepkg.conf /etc/makepkg.conf.orig
sudo cp conf/makepkg.conf /etc/makepkg.conf

# Build Stuff is needed to build AUR packages
sudo pacman -S --noconfirm base-devel

# Preliminaries are now out of the way; time for questions

say "Does this machine have a HIDPI screen?"
if $DIALOG --yesno "HIDPI screen?" 20 60 ;then
    sudo cp conf/vconsole.conf /etc
else
    echo "Nope."
fi

say "Do you want all the Google fonts?"
GoogleFonts=$($DIALOG --radiolist "Do you want all the Google Fonts (takes a long time to install)?" 20 60 12 \
    "y" "Install Google Fonts"  on \
    "n" "Too big; skip it"      off 2>&1 >/dev/tty)

say "Install standard desktop apps?"
DesktopApps=$($DIALOG --radiolist "Install standard desktop apps?" 20 60 12 \
    "y" "Yes" on \
    "n" "No" off 2>&1 >/dev/tty)

say "Install 3D printing apps?"
ThreeDPrintingApps=$($DIALOG --radiolist "Install 3D Printing Apps?" 20 60 12 \
    "y" "Yes" on \
    "n" "No" off 2>&1 >/dev/tty)

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
# sed 's/^GRUB_CMDLINE_LINUX_DEFAULT.*/& splash/'  /etc/default/grub
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
yay -S --noconfirm syncthingtray-qt6

# Power
sudo pacman -R --noconfirm power-profiles-daemon
sudo pacman -S --noconfirm tlp
sudo systemctl stop systemd-rfkill.service
sudo systemctl mask systemd-rfkill.service systemd-rfkill.socket
sudo systemctl start tlp.service
sudo systemctl enable tlp.service

## UI font
sudo pacman -S --noconfirm libertinus-font
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
sudo pacman -S --noconfirm ttf-iosevka-nerd
sudo pacman -S --noconfirm ttf-iosevkaterm-nerd
sudo pacman -S --noconfirm ttf-iosevkatermslab-nerd
#sudo pacman -S --noconfirm ttc-iosevka
#sudo pacman -S --noconfirm ttc-iosevka-slab
#sudo pacman -S --noconfirm ttc-iosevka-aile
#sudo pacman -S --noconfirm ttc-iosevka-etoile
yay -S --noconfirm  otf-fantasque-sans-mono 
yay -S --noconfirm ttf-mplus 
yay -S --noconfirm nerd-fonts-hermit 
yay -S --noconfirm ttf-anonymice-powerline-git 
if echo "$GoogleFonts" | grep -iq "^n" ;then
  yay -S --noconfirm ttf-carlito 
fi
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


if echo "$DesktopApps" | grep -iq "^y" ;then
    echo "Installing standard desktop apps...."

    # Standard desktop stuff

    if $_ismanjaro; then
      sudo pacman -R --noconfirm libreoffice-still
    fi
    sudo pacman -S --noconfirm xsel libdvdcss bottom pandoc-cli bash-completion audacity borg spamassassin razor calibre neovide mc p7zip whois projectm easytag fuse handbrake tk scribus vpnc networkmanager-vpnc fontforge kdiff3 dvgrab dvdauthor inkscape strawberry conky libreoffice-fresh offlineimap dovecot neomutt w3m urlscan lha zip unzip vifm xdg-desktop-portal filelight mplayer fzf ripgrep the_silver_searcher fd ranger libaacs mpv smplayer smplayer-skins smplayer-themes ctags pstoedit libmythes beanshell coin-or-mp yt-dlp atomicparsley aria2 discord cdrdao cdrtools libisofs dvd+rw-tools hunspell hunspell-en_us hyphen hyphen-en

    # Apps in AUR

    yay -S --noconfirm  todotxt freeplane todotxt-machine-git deb2targz moodbar boomaga libbdplus brave-bin joe zoom goneovim-bin

else
    echo "Skipping standard desktop apps...."
fi

if echo "$ThreeDPrintingApps" | grep -iq "^y" ;then
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

if echo "$GoogleFonts" | grep -iq "^y" ;then
    echo "Installing Google Fonts!"
    yay -S ttf-google-fonts-git
else
    echo "Skipping Google Fonts install...."
fi

if [ "$plasma" = false ] ;then
  echo "If you want to configure Plasma later, run configure-plasma6.sh from this folder."
  say "If you want to configure Plasma later, run configure-plasma6.sh from this folder."
fi

echo "All done! Please reboot your system now."
say "All done! Please reboot your system now."

exit 0;
