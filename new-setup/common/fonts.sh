#!/bin/bash 

cp conf/fonts.conf ~/.config/fontconfig
sudo mkdir /usr/share/fonts/custom
sudo cp fonts/*.ttf /usr/share/fonts/custom
sudo cp fonts/*.otf /usr/share/fonts/custom
sudo fc-cache -f -v

