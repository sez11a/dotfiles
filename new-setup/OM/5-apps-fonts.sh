#!/bin/sh 

# Fonts
sudo dnf -y install texlive-gentium texlive-gentium-tug
sudo dnf -y fonts-ttf-alegreya open-sans-fonts

source common/fonts.sh

## Java Environment
sudo dnf -y install https://cdn.azul.com/zulu/bin/zulu-repo-1.0.0-1.noarch.rpm
sudo dnf -y install zulu21-jdk

# Standard desktop stuff
sudo dnf -y install audacity borgbackup spamassassin calibre mc easytag handbrake scribus fontforge kdiff3 dvgrab dvdauthor inkscape strawberry lha mplayer fzf ranger mpv smplayer smplayer-themes pstoedit yt-dlp atomicparsley aria2 cdrdao dvd+rw-tools joe lib64aacs0 lib64aacs-devel nextcloud-client hunspell hunspell-tools hyphen-en 

# Standard Flatpak stuff
sudo flatpak -y install zoom

# Pandoc (until it gets in the repos) 
curl -OL https://github.com/jgm/pandoc/releases/download/3.6.4/pandoc-3.6.4-linux-amd64.tar.gz 
tar xvfz pandoc-3.6.4-linux-amd64.tar.gz --strip-components 1 -C $HOME/.local
rm pandoc-3.6.4-linux-amd64.tar.gz
