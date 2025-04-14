#!/bin/sh 

sudo dnf -qy install fs-uae atari800-x11 atari800-sdl atari800-roms atari800-ncurses atari800-common hatari vice vice-gtk vice-sdl dosbox-x

sudo flatpak -y install net.cebix.basilisk
