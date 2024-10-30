#!/bin/sh 

# Syncthing Integration
sudo dnf -qy copr enable mhartgring/syncthing-gtk
sudo dnf -qy install syncthing-gtk

# Fonts
sudo dnf -qy install sil-gentium-fonts sil-gentium-basic-fonts-all
sudo dnf -qy google-carlito-fonts 

cp conf/fonts.conf ~/.config/fontconfig
sudo mkdir /usr/share/fonts/TTF
sudo mkdir /usr/share/fonts/OTF
sudo cp fonts/*.ttf /usr/share/fonts/TTF
sudo cp fonts/*.otf /usr/share/fonts/OTF
sudo fc-cache -f -v

## Java Environment
sudo dnf -qy install https://cdn.azul.com/zulu/bin/zulu-repo-1.0.0-1.noarch.rpm
sudo dnf -qy install zulu21-jdk


if [ "$DesktopApps" = true ] ;then
  echo "Installing standard desktop apps...."

  # Standard desktop stuff
  sudo dnf -qy install pandoc audacity borgbackup spamassassin perl-Razor-Agent calibre neovim-qt mc p7zip easytag HandBrake HandBrake-gui scribus fontforge kdiff3 dvgrab dvdauthor inkscape strawberry conky lha vifm mplayer fzf ripgrep ranger libaacs mpv smplayer smplayer-themes pstoedit yt-dlp AtomicParsley aria2 cdrdao libisofs dvd+rw-tools libbdplus joe 
  sudo dnf -qy copr enable mdwalters/neovide
  sudo dnf -qy install neovide

else
  echo "Skipping standard desktop apps...."
fi
