#!/bin/sh

yaourt -S --noconfirm jdk squirrel-sql
sudo archlinux-java set java-8-jdk

sudo pacman -S --noconfirm qgit lazarus-qt fpc gdb nodejs npm eclipse-jee

mkdir ~/.npm-packages
NPM_PACKAGES=~/.npm-packages
echo prefix=/home/sezovr/.npm-packages >> ~/.npmrc
#curl -L https://www.npmjs.org/install.sh | sh
#echo NODE_PATH=\"\$NPM_PACKAGES/lib/node_modules\:\$NODE_PATH\" >> ~/.profile
#echo PATH=\"\$NPM_PACKAGES/bin\:\$PATH\" >> ~/.profile

