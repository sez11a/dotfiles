#!/bin/bash

## Enable prompt from starship
sudo dnf -qy copr enable shdwchn10/AllTheTools
sudo dnf -qy install starship 

## Apps requiring advanced configuration or an account
sudo dnf -qy install offlineimap dovecot neomutt w3m urlscan discord

## Undelete files
sudo dnf -qy install ddrescue testdisk extundelete

