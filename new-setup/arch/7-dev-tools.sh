#!/bin/sh

yay -S --noconfirm squirrel-sql

sudo pacman -S --noconfirm source-highlight lazarus-qt5 fpc gdb nodejs npm kdiff3 netbeans github-cli ruby rubygems gitui yarn

sudo pacman -S --noconfirm podman podman-compose podman-docker podman-desktop

yay -S --noconfirm rbenv gitahead

mkdir ~/.npm-packages
NPM_PACKAGES=~/.npm-packages
echo prefix=~/.npm-packages >> ~/.npmrc
