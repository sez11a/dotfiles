#!/bin/bash

# Syncthing Integration
yay -S --noconfirm syncthing-gtk

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

cp conf/fonts.conf ~/.config/fontconfig
sudo mkdir /usr/share/fonts/TTF
sudo mkdir /usr/share/fonts/OTF
sudo cp fonts/*.ttf /usr/share/fonts/TTF
sudo cp fonts/*.otf /usr/share/fonts/OTF
sudo fc-cache -f -v

# Java Environment
yay -S --noconfirm zulu-21-bin
sudo archlinux-java set zulu-21


if [ "$DesktopApps" = true ] ;then
    echo "Installing standard desktop apps...."

    # Standard desktop stuff

    if $_ismanjaro; then
      sudo pacman -R --noconfirm libreoffice-still
    fi
    sudo pacman -S --noconfirm xsel libdvdcss bottom pandoc-cli audacity borg spamassassin razor calibre neovide mc p7zip whois projectm easytag fuse handbrake tk scribus vpnc networkmanager-vpnc fontforge kdiff3 dvgrab dvdauthor inkscape strawberry conky libreoffice-fresh lha zip unzip vifm xdg-desktop-portal filelight mplayer fzf ripgrep fd ranger libaacs mpv smplayer smplayer-skins smplayer-themes ctags pstoedit libmythes beanshell coin-or-mp yt-dlp atomicparsley aria2 cdrdao cdrtools libisofs dvd+rw-tools hunspell hunspell-en_us hyphen hyphen-en

    # Apps in AUR

    yay -S --noconfirm  todotxt freeplane todotxt-machine-git deb2targz moodbar boomaga libbdplus brave-bin joe zoom goneovim-bin

else
    echo "Skipping standard desktop apps...."
fi
