#!/bin/sh

if [ "$LaTeX" = true ] ;then

  sudo pacman -S --noconfirm texlive-meta texlive-binextra texlive-fontsrecommended texlive-langextra texlive-langgreek texlive-latexextra biber

else 
  echo "Not installing LaTeX." 
fi
