#!/bin/sh

## Add this to /etc/pacman.conf first

#[infinality-bundle]
#Server = http://bohoomil.com/repo/$arch

#[infinality-bundle-multilib]
#Server = http://bohoomil.com/repo/multilib/$arch

#[infinality-bundle-fonts]
#Server = http://bohoomil.com/repo/fonts

# Infinality Fonts

#sudo pacman-key -r 962DDE58
#sudo pacman-key --lsign-key 962DDE58

#cat /etc/pacman.conf infinality-repos.txt > font-repos.txt
#sudo cp font-repos.txt /etc/pacman.conf

sudo pacman-mirrors -f 0
sudo pacman -Syu

# AUR Helper
# Presumably, if we've gone through the AUI Arch install, we already
# have our AUR helper. On Manjaro, it's in the repo, so we can just
# call the installer and get it.

sudo pacman -S --noconfirm yay

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
sudo pacman -S --noconfirm festival festival-english festival-us
function say { echo "$1" | festival --tts; }
export -f say
DIALOG=whiptail

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

say "Which desktop do you want to configure?"
Desktop=$($DIALOG --radiolist "Plasma 5 or XFCE?" 20 60 12 \
    "p" "Plasma 5"  on \
    "x" "XFCE"      off 2>&1 >/dev/tty)

say "Do you want the VimStar config?"
VimStar=$($DIALOG --radiolist "Do you want the VimStar NeoVim config?" 20 60 12 \
    "y" "Install VimStar"  on \
    "n" "I already have my own Vim config"      off 2>&1 >/dev/tty)

## Editor

sudo pacman -S --noconfirm neovim joe python-neovim xclip wl-clipboard

if echo "$VimStar" | grep -iq "^y" ;then
    echo "Installing VimStar!"
	curl -sLf https://raw.githubusercontent.com/sez11a/VimStar/master/install-vimstar.sh | bash
else
    echo "Skipping VimStar install...."
fi

## Mouse Cursors

sudo pacman -U --noconfirm breeze-red-cursor-theme-1.0-3-any.pkg.tar.xz oxygen-cursors-extra-5.16.2-1-any.pkg.tar.xz
#yay -S --noconfirm  breeze-red-cursor-theme

## Fonts

sudo pacman -S --noconfirm gentium-plus-font
yay -S --noconfirm  otf-fantasque-sans-mono 
yay -S --noconfirm ttf-mplus 
yay -S --noconfirm nerd-fonts-hermit 
yay -S --noconfirm ttf-anonymice-powerline-git 
yay -S --noconfirm ttf-carlito 
yay -S --noconfirm ttf-iosevka 
yay -S --noconfirm ttf-iosevka-slab 
yay -S --noconfirm ttf-gidole 
yay -S --noconfirm otf-libertinus
# Moved Vegur to its own line because it's currently broken in AUR
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

# Syncthing

sudo pacman -S --noconfirm syncthing
echo "fs.inotify.max_user_watches=524288" | sudo tee -a /etc/sysctl.d/90-override.conf

# Grub

# yay -S --noconfirm  grub2-theme-dharma-mod

# sudo cp grub /etc/default
# sudo grub-mkconfig -o /boot/grub/grub.cfg

# Plymouth
# Commented out below because Plymouth is no longer installed by default.
#sudo cp plymouthd.conf /etc/plymouth
#sudo plymouth-set-default-theme -R spinner

# Startup Sound

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
    sudo pacman -S --noconfirm xsel libdvdcss youtube-dl pandoc bash-completion audacity calibre neovide mc tlp p7zip whois projectm easytag exfat-utils fuse handbrake tk scribus vpnc networkmanager-vpnc fontforge kdiff3 dvgrab dvdauthor inkscape strawberry conky libreoffice-fresh offlineimap dovecot neomutt w3m urlscan chromium lha zip unzip vifm xdg-desktop-portal filelight mplayer fzf ripgrep the_silver_searcher fd ranger libaacs mpv smplayer smplayer-skins smplayer-themes smtube ctags pstoedit libmythes beanshell coin-or-mp yt-dlp atomicparsley aria2 discord powerline python-powerline

    # Apps in AUR

    yay -S --noconfirm  todotxt slack-desktop freeplane todotxt-machine-git deb2targz moodbar boomaga libbdplus pdfsam ted brave-bin python-powerline-gitstatus

else
    echo "Skipping standard desktop apps...."
fi

if echo "$ThreeDPrintingApps" | grep -iq "^y" ;then
    echo "Installing 3D Printing apps...." 

    sudo pacman -S --noconfirm superslicer prusa-slicer freecad openscad
    yay -S --noconfirm cura-modern-appimage

else 
    echo "Skipping 3D Printing Apps...." 
fi

# Printers

#sudo pacman -U --noconfirm brother-mfc-9340cdw-1.1.2-1-x86_64.pkg.tar.xz
yay -S --noconfirm brother-hll6200dw cnrdrvcups-lb

# Dotfiles

zip old-config-files.zip ~/.profile ~/.bash_profile ~/.bashrc ~/.bash_logout ~/.xprofile
rm ~/.profile ~/.bash_profile ~/.bashrc ~/.bash_logout ~/.xprofile
mv old-config-files.zip ~
git submodule init
git submodule update
../install


if echo "$Desktop" | grep -iq "^p" ;then
    echo "Plasma 5"
    source ./configure-plasma5.sh
else
    echo "XFCE"
    source ./configure-xfce.sh
fi

say "Do you want to install developer tools?"
if $DIALOG --yesno "Install Dev Tools?" 20 60 ;then
    source ./install-dev-tools.sh; else echo "Nope."; fi

say "Do you need LaTeX?"
if $DIALOG --yesno "Install LaTeX?" 20 60 ;then
    source ./install-latex.sh; else echo "Nope."; fi

say "Do you want to install emulators for vintage computing?"
if $DIALOG --yesno "Install emulators?" 20 60 ;then
    source ./install-emulators.sh; else echo "Nope."; fi

if echo "$GoogleFonts" | grep -iq "^y" ;then
    echo "Installing Google Fonts!"
    yay -S ttf-google-fonts-git
else
    echo "Skipping Google Fonts install...."
fi

echo "All done! Please reboot your system now."
say "All done! Please reboot your system now."

exit 0;