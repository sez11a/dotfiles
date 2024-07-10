#!/bin/sh

if [ "$DevTools" = true ] ;then

  yay -S --noconfirm squirrel-sql

  sudo pacman -S --noconfirm source-highlight lazarus-qt5 fpc gdb nodejs npm kdiff3 netbeans github-cli ruby rubygems gitui

  sudo pacman -S --noconfirm docker docker-compose 

  yay -S --noconfirm rbenv gitahead

  mkdir ~/.npm-packages
  NPM_PACKAGES=~/.npm-packages
  echo prefix=~/.npm-packages >> ~/.npmrc
else 
  echo "Not installing Dev Tools" 
fi
