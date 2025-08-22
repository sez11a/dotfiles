#!/bin/bash

## Apps required for special hardware

# NVidia graphics switching
sudo dnf -y install envycontrol

## Apps requiring advanced configuration or an account
sudo dnf -y install offlineimap dovecot neomutt w3m urlscan discord

## Undelete files
sudo dnf -y install ddrescue extundelete

## Zram
sudo dnf install zram-init
sudo modprobe zram
sudo systemctl start zram_swap.service
sudo systemctl start zram_tmp.service
sudo systemctl start zram_var_tmp.service
sudo systemctl enable zram_swap.service
sudo systemctl enable zram_tmp.service
sudo systemctl enable zram_var_tmp.service
