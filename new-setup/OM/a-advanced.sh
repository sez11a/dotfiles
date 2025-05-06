#!/bin/bash

## Apps required for special hardware

# NVidia graphics switching
sudo dnf -y install envycontrol

## Apps requiring advanced configuration or an account
sudo dnf -y install offlineimap dovecot neomutt w3m urlscan discord

## Undelete files
sudo dnf -y install ddrescue extundelete

