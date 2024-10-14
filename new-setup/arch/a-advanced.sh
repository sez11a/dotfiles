#!/bin/bash

# Enable prompt from starship
sudo pacman -S --noconfirm starship

# Apps requiring advanced configuration or an account
sudo pacman -S --noconfirm offlineimap dovecot neomutt w3m urlscan discord

# Undelete Files

sudo pacman -S --noconfirm ddrescue ext4magic testdisk
yay -S --noconfirm  r-linux extundelete
