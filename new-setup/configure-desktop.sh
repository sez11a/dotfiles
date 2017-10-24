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

sudo pacman-mirrors -g
sudo pacman -Syu

#sudo pacman -S infinality-bundle

# Editor 

sudo pacman -S --noconfirm neovim joe python-neovim
sudo pacman -S --noconfirm ttf-linux-libertine ttf-gentium 

# Fonts
yaourt -S --noconfirm ttf-fantasque-sans ttf-mplus otf-vegur ttf-exljbris otf-hermit ttf-anonymice-powerline-git ttf-caladea ttf-carlito
sudo pacman -R noto-fonts ttf-droid ttf-inconsolata
yaourt -S ttf-google-fonts-git

# sudo cp 35-repl-custom.conf /etc/fonts/conf.avail.infinality
sudo cp fonts-local.conf /etc/fonts/local.conf
cp fonts.conf ~/.config/fontconfig

sudo cp fonts/*.ttf /usr/share/fonts/TTF
sudo cp fonts/*.otf /usr/share/fonts/OTF
sudo fc-cache -f -v

# Mouse Cursors

sudo pacman -U --noconfirm breeze-red-cursor-theme-1.0-3-any.pkg.tar.xz
#yaourt -S --noconfirm breeze-red-cursor-theme

# Syncthing

sudo pacman -S --noconfirm syncthing syncthing-gtk syncthing-inotify
echo "fs.inotify.max_user_watches=524288" | sudo tee -a /etc/sysctl.d/90-override.conf

# Grub

yaourt -S --noconfirm grub2-theme-dharma-mod

sudo cp grub /etc/default
sudo grub-mkconfig -o /boot/grub/grub.cfg

# Plymouth 

sudo cp plymouthd.conf /etc/plymouth
sudo plymouth-set-default-theme -R spinner

# Startup Sound

sudo mkdir /usr/share/sounds/custom
sudo cp a1000.wav /usr/share/sounds/custom
sudo cp startup-sound.sh /usr/bin
sudo cp startupsound.service /etc/systemd/system
sudo systemctl enable startupsound.service

# Standard desktop stuff

sudo pacman -R --noconfirm libreoffice-still
sudo pacman -S --noconfirm xsel libdvdcss youtube-dl pandoc bash-completion audacity calibre mc p7zip whois projectm easytag exfat-utils fuse handbrake tk scribus vpnc networkmanager-vpnc fontforge synfigstudio kdiff3 dvgrab dvdauthor inkscape clementine festival-english festival-us conky libreoffice-fresh offlineimap dovecot chromium lha normalize pdfsam

sudo pacman -S --noconfirm virtualbox virtualbox-host-dkms

# Apps in AUR

yaourt -S --noconfirm jdk
sudo archlinux-java set java-8-jdk
yaourt -S --noconfirm kindlegen todotxt slack-desktop skypeforlinux-bin gitter pepper-flash freeplane todotxt-machine-git deb2targz
yaourt -S google-musicmanager google-talkplugin
# Removed Moodbar from above because it pulls in all the old GStreamer stuff

# Printers

sudo pacman -U brother-mfc-9340cdw-1.1.2-1-x86_64.pkg.tar.xz

# Environment 

function say { echo "$1" | festival --tts; }
export -f say

../install 

say "Which desktop do you want to configure?"
DIALOG=whiptail
Desktop=$($DIALOG --radiolist "Plasma 5 or XFCE?" 20 60 12 \
    "p" "Plasma 5"  on \
    "x" "XFCE"      off 2>&1 >/dev/tty)

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

say "Do you want to instal emulators for vintage computing?"
if $DIALOG --yesno "Install emulators?" 20 60 ;then
    source ./install-emulators.sh; else echo "Nope."; fi

echo "All done! Please reboot your system now."
say "All done! Please reboot your system now."

exit 0;
