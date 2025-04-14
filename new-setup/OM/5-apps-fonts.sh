#!/bin/sh 

# Syncthing Integration
sudo flatpak -y install Syncthingy 

# Fonts
sudo dnf -y install texlive-gentium texlive-gentium-tug
sudo dnf -y fonts-ttf-alegreya open-sans-fonts

source common/fonts.sh

## Java Environment
sudo dnf -y install https://cdn.azul.com/zulu/bin/zulu-repo-1.0.0-1.noarch.rpm
sudo dnf -y install zulu21-jdk

# Standard desktop stuff
sudo dnf -y install audacity borgbackup spamassassin calibre mc easytag handbrake scribus fontforge kdiff3 dvgrab dvdauthor inkscape strawberry lha mplayer fzf ripgrep ranger mpv smplayer smplayer-themes pstoedit yt-dlp atomicparsley aria2 cdrdao dvd+rw-tools joe 

