#!/bin/bash

DIALOG=whiptail

# AUR Helper
# If on Arch, install this before running this script. On Manjaro, it's in the repo, so we can just
# call the installer and get it.

sudo pacman -S --noconfirm yay

sudo pacman-mirrors -f 0
sudo pacman -Syu

# AUR Performance
# Install the multicore compression utilities.
# Rename makepkg.conf and replace it with the multicore version.

sudo pacman -S --noconfirm pbzip2 pigz lbzip2 lrzip
sudo mv /etc/makepkg.conf /etc/makepkg.conf.orig
sudo cp makepkg.conf /etc/makepkg.conf

# Build Stuff
sudo pacman -S --noconfirm base-devel

# Environment

cp ./desktop/*.desktop ~/Desktop
sudo pacman -S --noconfirm festival festival-english festival-us rsync
function say { echo "$1" | festival --tts; }
export -f say
yay -S --noconfirm zulu-11-bin zulu-8-bin
sudo archlinux-java set zulu-11

## Editor

sudo pacman -S --noconfirm neovim python-pynvim xclip wl-clipboard jq
git clone https://github.com/AstroNvim/AstroNvim ~/.astronvim
ln -s ~/.astronvim ~/.config/nvim
git clone https://github.com/sez11a/astronvim-writing ~/.config/nvim/lua/user

# Dotfiles

zip old-config-files.zip ~/.profile ~/.bash_profile ~/.bashrc ~/.bash_logout ~/.xprofile
rm ~/.profile ~/.bash_profile ~/.bashrc ~/.bash_logout ~/.xprofile
mv old-config-files.zip ~
git submodule init
git submodule update
../install

# Power

sudo pacman -R power-profiles-daemon
sudo pacman -S tlp
sudo systemctl stop systemd-rfkill.service
sudo systemctl mask systemd-rfkill.service systemd-rfkill.socket
sudo systemctl start tlp.service
sudo systemctl enable tlp.service

# Questions

## Console config

say "Does this machine have a HIDPI screen?"
if $DIALOG --yesno "HIDPI screen?" 20 60 ;then
    sudo cp vconsole.conf /etc
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

# Commenting out Vimstar in favor of Astronvim, but not removing as it may have future life.
# say "Do you want the VimStar config?"
# VimStar=$($DIALOG --radiolist "Do you want the VimStar NeoVim config?" 20 60 12 \
#     "y" "Install VimStar"  on \
#     "n" "I already have my own Vim config"      off 2>&1 >/dev/tty)

# if echo "$VimStar" | grep -iq "^y" ;then
#     echo "Installing VimStar!"
# 	curl -sLf https://raw.githubusercontent.com/sez11a/VimStar/master/install-vimstar.sh | bash
# else
#     echo "Skipping VimStar install...."
# fi

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


# Syncthing

sudo pacman -S --noconfirm syncthing
echo "fs.inotify.max_user_watches=524288" | sudo tee -a /etc/sysctl.d/90-override.conf

# Syncthing Integration

yay -S --noconfirm c++utilities qtutilities qtforkawesome syncthingtray

# Desktop
source ./configure-plasma5.sh

## Mouse Cursors

sudo pacman -U --noconfirm breeze-red-cursor-theme-1.0-3-any.pkg.tar.xz 
#yay -S --noconfirm  breeze-red-cursor-theme

## Fonts

sudo pacman -S --noconfirm gentium-plus-font
sudo pacman -S --noconfirm ttc-iosevka
sudo pacman -S --noconfirm ttc-iosevka-slab
sudo pacman -S --noconfirm ttc-iosevka-aile
sudo pacman -S --noconfirm ttc-iosevka-etoile
yay -S --noconfirm  otf-fantasque-sans-mono 
yay -S --noconfirm ttf-mplus 
yay -S --noconfirm nerd-fonts-hermit 
yay -S --noconfirm ttf-anonymice-powerline-git 
yay -S --noconfirm ttf-carlito 
yay -S --noconfirm ttf-gidole 
yay -S --noconfirm otf-libertinus
yay -S --noconfirm otf-vegur 
yay -S --noconfirm otf-tenderness 
yay -S --noconfirm ttf-exljbris

## Removed Caladea from above because it conflicted with Google Fonts

sudo cp fonts-local.conf /etc/fonts/local.conf
cp fonts.conf ~/.config/fontconfig
sudo mkdir /usr/share/fonts/TTF
sudo mkdir /usr/share/fonts/OTF
sudo cp fonts/*.ttf /usr/share/fonts/TTF
sudo cp fonts/*.otf /usr/share/fonts/OTF
sudo fc-cache -f -v

# Plymouth

sudo pacman -S --noconfirm plymouth
sudo plymouth-set-default-theme -R bgrt

# sudo cp grub /etc/default
# sudo grub-mkconfig -o /boot/grub/grub.cfg

# Startup Sound

sudo pacman -S --noconfirm alsa-utils
sudo mkdir /usr/share/sounds/custom
sudo cp a1000.wav /usr/share/sounds/custom
sudo cp startup-sound.sh /usr/bin
sudo cp startupsound.service /etc/systemd/system
sudo systemctl enable startupsound.service

# Undelete Files

sudo pacman -S --noconfirm ext4magic testdisk
yay -S --noconfirm  r-linux extundelete


if echo "$DesktopApps" | grep -iq "^y" ;then
    echo "Installing standard desktop apps...."

    # Standard desktop stuff

    sudo pacman -R --noconfirm libreoffice-still
    sudo pacman -S --noconfirm xsel libdvdcss bottom pandoc-cli bash-completion audacity borg calibre neovide mc p7zip whois projectm easytag fuse handbrake tk scribus vpnc networkmanager-vpnc fontforge kdiff3 dvgrab dvdauthor inkscape strawberry conky libreoffice-fresh offlineimap dovecot neomutt w3m urlscan lha zip unzip vifm xdg-desktop-portal filelight mplayer fzf ripgrep the_silver_searcher fd ranger libaacs mpv smplayer smplayer-skins smplayer-themes ctags pstoedit libmythes beanshell coin-or-mp yt-dlp atomicparsley aria2 discord cdrdao cdrtools libisofs dvd+rw-tools hunspell hunspell-en_us hyphen hyphen-en

    # Apps in AUR

    yay -S --noconfirm  todotxt freeplane todotxt-machine-git deb2targz moodbar boomaga libbdplus pdfsam brave-bin joe zoom

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
sudo pacman -S --noconfirm brother-mfc-9340cdw
yay -S --noconfirm brother-hll6200dw cnrdrvcups-lb


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

echo "All done! Please reboot your system now."
say "All done! Please reboot your system now."

exit 0;
