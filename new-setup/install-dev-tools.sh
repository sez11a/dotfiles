#!/bin/sh

yay -S --noconfirm zulu-11-bin zulu-8-bin squirrel-sql
sudo archlinux-java set zulu-11

sudo pacman -S --noconfirm source-highlight lazarus-qt5 fpc gdb nodejs npm kdiff3 netbeans github-cli ruby rubygems

yay -S --noconfirm rbenv gitahead

mkdir ~/.npm-packages
NPM_PACKAGES=~/.npm-packages
echo prefix=~/.npm-packages >> ~/.npmrc