#!/usr/bin/bash

function pause() {
	read -p "$*"
}

echo "This script launches the installation routine for these dotfiles."
echo "It supports OpenMandriva, Arch, Fedora, and to a lesser extent, Debian."
echo "Ensure you have Git installed before continuing."
echo " "
pause "Press Enter to continue or Ctrl-C to quit."
cd ~

if [ ! -d ".dotfiles" ]; then
  echo "Cloning dotfiles into ~/.dotfiles..."
  git clone --depth 1 --single-branch --branch master https://github.com/sez11a/dotfiles ~/.dotfiles
  cd ~/.dotfiles
  git submodule init
  git submodule update --recursive
else
  echo "Updating dotfiles..."
  git -C ~/.dotfiles pull
fi

cd ~

cd ~/.dotfiles/new-setup
exec ./configure-os.sh