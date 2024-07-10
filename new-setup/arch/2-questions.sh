#!/bin/bash

say "Does this machine have a HIDPI screen?"
if $DIALOG --yesno "HIDPI screen?" 20 60 ;then
    sudo cp conf/vconsole.conf /etc
else
    echo "Nope."
fi

DesktopApps=false
say "Install standard desktop apps?"
if $DIALOG --yesno "Install standard desktop apps?" 20 60; then 
  DesktopApps=true; else echo "Nope."; fi 

ThreeDPrintingApps=false
say "Install 3D printing apps?"
if $DIALOG --yesno "Install 3D printing apps?" 20 60; then 
  ThreeDPrintingApps=true; else echo "Nope."; fi 

DevTools=false
say "Do you want to install developer tools?"
if $DIALOG --yesno "Install Dev Tools?" 20 60 ;then
    DevTools=true; else echo "Nope."; fi

LaTeX=false
say "Do you want to install LaTeX?"
if $DIALOG --yesno "Install LaTeX?" 20 60 ;then
    LaTeX=true; else echo "Nope."; fi

emulators=false
say "Do you want to install emulators for vintage computing?"
if $DIALOG --yesno "Install emulators for vintage computing?" 20 60 ;then
    emulators=true; else echo "Nope."; fi

plasma=false
say "Configure Plasma Desktop?"
if $DIALOG --yesno "Configure Standard Plasma Desktop? Default is yes; if installing a lightweight system, answer no." 20 60; then 
  plasma=true; else echo "Nope."; fi
