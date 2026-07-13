#!/bin/sh

# Fonts
sudo apt install -y texlive-fonts-extra

source common/fonts.sh

## Enable Brave
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
sudo curl -fsSLo /etc/apt/sources.list.d/brave-browser-release.sources https://brave-browser-apt-release.s3.brave.com/brave-browser.sources
sudo apt update
sudo apt install -y brave-browser

sudo apt install -y ubuntu-restricted-extras

# Standard desktop stuff
sudo apt install -y audacity borgbackup spamassassin calibre mc easytag handbrake scribus fontforge kdiff3 dvgrab dvdauthor inkscape keepassxc strawberry lha mplayer fzf ranger mpv smplayer smplayer-themes pstoedit yt-dlp atomicparsley aria2 cdrdao dvd+rw-tools joe nextcloud-desktop hunspell hyphen-en-us whois libprojectm2v5 vpnc network-manager-vpnc network-manager-applet 7zip vifm pandoc

# Standard Snap stuff
snap install zoom-client freeplane-mindmapping zotero-snap
