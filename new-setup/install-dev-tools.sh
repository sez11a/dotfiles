#!/bin/sh

trizen -S --noconfirm jdk8-openjdk squirrel-sql
sudo archlinux-java set java-8-openjdk

sudo pacman -S --noconfirm source-highlight qgit lazarus-qt5 fpc gdb nodejs npm eclipse-jee kdiff3

mkdir ~/.npm-packages
NPM_PACKAGES=~/.npm-packages
echo prefix=~/.npm-packages >> ~/.npmrc
#curl -L https://www.npmjs.org/install.sh | sh
#echo NODE_PATH=\"\$NPM_PACKAGES/lib/node_modules\:\$NODE_PATH\" >> ~/.profile
#echo PATH=\"\$NPM_PACKAGES/bin\:\$PATH\" >> ~/.profile

