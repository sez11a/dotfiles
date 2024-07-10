#!/bin/sh

if [ "$LaTeX" = true ] ;then

  sudo pacman -S --noconfirm texlive-core texlive-bibtexextra texlive-bin texlive-fontsextra texlive-formatsextra texlive-games texlive-humanities texlive-langextra texlive-langgreek texlive-latexextra texlive-music texlive-pictures texlive-pstricks texlive-publishers texlive-science biber

else 
  echo "Not installing LaTeX." 
fi
