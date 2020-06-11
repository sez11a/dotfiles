#!/bin/sh

yay -S --noconfirm jdk8-openjdk squirrel-sql eclipse-common eclipse-jee
sudo archlinux-java set java-8-openjdk

sudo pacman -S --noconfirm source-highlight qgit lazarus-qt5 fpc gdb nodejs npm kdiff3 netbeans

mkdir ~/.npm-packages
NPM_PACKAGES=~/.npm-packages
echo prefix=~/.npm-packages >> ~/.npmrc

