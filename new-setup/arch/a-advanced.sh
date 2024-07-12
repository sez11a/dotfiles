#!/bin/bash

# Enable prompt from oh-my-posh
yay -S --noconfirm oh-my-posh

# Apps requiring advanced configuration or an account
sudo pacman -S --noconfirm offlineimap dovecot neomut w3m urlscan discord

# Undelete Files

sudo pacman -S --noconfirm ddrescue ext4magic testdisk
yay -S --noconfirm  r-linux extundelete
