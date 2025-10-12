#!/bin/sh

# Fonts
sudo dnf -y fonts-ttf-alegreya open-sans-fonts

source common/fonts.sh

## Enable Brave
sudo wget https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo -O /etc/yum.repos.d/brave-browser.repo
sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
sudo dnf -y install brave-browser

# Standard desktop stuff
sudo dnf -y install audacity borgbackup spamassassin calibre mc easytag handbrake scribus fontforge kdiff3 dvgrab dvdauthor inkscape keepassxc strawberry lha mplayer fzf ranger mpv smplayer smplayer-themes pstoedit yt-dlp atomicparsley aria2 cdrdao dvd+rw-tools joe lib64aacs0 lib64aacs-devel nextcloud-client hunspell hunspell-tools hyphen-en whois lib64dvdcss lib64projectm3 vpnc networkmanager-vpnc rust-ripgrep fuse fuse2 zip unzip 7zip

# After UM
dnf -y install --enablerepo=cooker-x86_64-extra vifm

# Standard Flatpak stuff
sudo flatpak -y install us.zoom.Zoom org.freeplane.App org.zotero.Zotero

# Pandoc (until it gets in the repos)
curl -OL https://github.com/jgm/pandoc/releases/download/3.6.4/pandoc-3.6.4-linux-amd64.tar.gz
tar xvfz pandoc-3.6.4-linux-amd64.tar.gz --strip-components 1 -C $HOME/.local
rm pandoc-3.6.4-linux-amd64.tar.gz