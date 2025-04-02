#!/bin/sh 

# Syncthing Integration
sudo dnf -qy copr enable mhartgring/syncthing-gtk
sudo dnf -qy install syncthing-gtk

# Fonts
sudo dnf -qy install sil-gentium-fonts sil-gentium-basic-fonts-all
sudo dnf -qy google-carlito-fonts 

source common/fonts.sh

## Java Environment
sudo dnf -qy install https://cdn.azul.com/zulu/bin/zulu-repo-1.0.0-1.noarch.rpm
sudo dnf -qy install zulu21-jdk

# Standard desktop stuff
sudo dnf -qy install pandoc audacity borgbackup spamassassin perl-Razor-Agent calibre neovim-qt mc p7zip easytag HandBrake HandBrake-gui scribus fontforge kdiff3 dvgrab dvdauthor inkscape strawberry conky lha vifm mplayer fzf ripgrep ranger libaacs mpv smplayer smplayer-themes pstoedit yt-dlp AtomicParsley aria2 cdrdao libisofs dvd+rw-tools libbdplus joe worker
sudo dnf -qy copr enable mdwalters/neovide
sudo dnf -qy install neovide

